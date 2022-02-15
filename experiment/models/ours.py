import numpy as np
import multiprocessing as mp
from pdb import set_trace
from copy import deepcopy

from utmLib import utils
from utmLib.clses import Timer
from utmLib.parmapper import Xmap
from core.contcnet import ContCNet, nn_conf
from core.varpick import most_var, hard_max_mincorr
from core.tinylib import evaluate_result, logmass_statistic, pca_analysis

def fast_log_mass(m, data):
    x_data = data[:,m.xids]
    px_logmass = np.log(m.px.mass(x_data))
    pyx_logmass = m.score(data, return_mass=True)
    logmass = px_logmass + pyx_logmass
    return logmass

def worker_func(param, extra):
    # actual task to do
    def _run_(param, extra, Q):
        i, (X, lr, fr) = param
        train, test, query, gt, sample_size, cache_dir, device, gpuid = extra

        cf = deepcopy(nn_conf)
        cf.fsize = fr
        cf.max_LR = lr
        if device != 'cpu':
            cf.device = 'cuda:{}'.format(gpuid[i % len(gpuid)])
        else:
            cf.device = 'cpu'

        model = ContCNet(mode='MixMG', conf=cf).fit(train, cutset_var=X, verbose=False)
        model.save_as_file('{}/ours-{}.pt'.format(cache_dir, i))
        pred = model.predict(test, query, N=int(sample_size/2), parallel=1)
        perf = evaluate_result(gt, pred, query, output_var=1)
        Q.put( (perf,i) )

    queue = mp.Queue()
    p = mp.Process(target=_run_, args = (param, extra, queue))
    p.start()
    ret = queue.get()
    p.join()
    p.terminate()
    return ret

def tune_and_fit(train, valid, masked_valid, options, verbose = True):
    full_train = np.vstack([train, valid])

    # define hyper params to tune
    cond_pcts = [i/10.0 for i in range(1,5)]
    pick_method = [most_var]
    max_LR = [0.025, 0.01, 0.004]
    if options.transform is None:
        feature_ratio = list(np.unique(   pca_analysis(full_train, percentiles=[0.9, 0.95, 0.97, 0.99])  ))
    else:
        feature_ratio = [train.shape[1]]

    allX = {}
    for p,f in utils.product(cond_pcts, pick_method):
        X = f(full_train, (p,2), np.inf, exclude = options.exclude)
        X = tuple(sorted(X))
        if X not in allX:
            allX[X] = [ '{}-{}%'.format(f._name_, int(p*100)) ]
        else:
            allX[X].append( '{}-{}%'.format(f._name_, int(p*100)) )
    varX = list(allX.keys())

    maskV, queryV = masked_valid
    params = list(enumerate(utils.product(varX, max_LR, feature_ratio)))
    extra = (train, maskV, queryV, valid, options.sample_size, options.cache_dir, options.device, options.gpuid)
    if verbose:
        print( 'Total number of hyper-params:{}'.format(len(params)) )

    options.procs = options.cpus if options.device == 'cpu' else (options.gpus*len(options.gpuid))
    options.procs = min(options.procs, len(params))
    tune_result = list(Xmap(worker_func, params, N=options.procs, daemon=False, progress=True, args=(extra,) ))
    tune_result.sort()

    # determine best idx
    b_rmse, b_std = tune_result[0][0]
    best_val = 2.0
    best_idx = None
    N = max(5, int(len(params)*0.1 + 1))
    for perf, i in tune_result[0:N]:
        r_rmse = perf[0] / b_rmse
        r_std = perf[1] / b_std
        val = r_rmse * r_std
        if val < best_val:
            best_val = val
            best_idx = i

    # print top hyper params and its performance
    ntop = (N*5) if verbose else 1
    for perf, i in tune_result[0:ntop]:
        X, lr, fr = params[i][1]
        method_str = '/'.join(allX[X])
        postfix = '<- chosen' if i == best_idx else ''
        print('{:2d}-Methods:{} ## MaxLR:{} FR:{} -> RMSE:{:.4f} STD:{:.4f} {}'.format(i, method_str, lr, fr, perf[0], perf[1], postfix))

    best_model_path = '{}/ours-{}.pt'.format(options.cache_dir, best_idx)
    def fine_tune():
        ft_device = 'cpu' if options.device == 'cpu' else 'cuda:0'
        model = ContCNet.load_from_file(best_model_path, device = ft_device)
        model = model.refit(full_train, verbose = verbose)
        model.save_as_file(best_model_path + '.fine_tune')

    p = mp.Process(target=fine_tune)
    p.start()
    p.join()
    p.terminate()
    model = ContCNet.load_from_file(best_model_path + '.fine_tune', device = 'cpu')
    return model

def run_exp(dataset, options):
    print('Running our model ....')
    np.random.seed(options.seed)

    train, valid, test_set = dataset
    full_train = np.vstack([train, valid])
    myclock = Timer()
    model_file = '{}/ours.model'.format(options.dir)

    try:
        model = ContCNet.load_from_file(model_file, device = 'cpu')
        print('Load pretrained ccnet model.')
    except:
        model = tune_and_fit(train, valid, options.valid_extra, options)
        if options.dir != '':
            model.save_as_file(model_file)
            # model.py.gbn.g.dump(fpath = '{}/leaf_gbn.jpg'.format(options.dir))
    myclock.ring('model fitting')

    N = len(model.yids)
    nrm = model.removed_counter
    total = int(N * (N-1)/2)
    print('Number of edges removed: {}/{} = {:.2f}%'.format(nrm, total, 100*nrm/total))
    print('MixMG number of components: {}'.format(model.px.W.size))

    train_logmass = fast_log_mass(model, full_train)
    test_logmass  = fast_log_mass(model, options.gt)
    print('Ours train logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format( *logmass_statistic(train_logmass) ))
    print('Ours test  logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format( *logmass_statistic(test_logmass) ))
    myclock.ring('Ours logmass computation')

    result = []
    for i,query in enumerate(options.query_var):
        model_result = []
        test = test_set[i].copy()
        pred = model.predict(test, query, N = options.sample_size, parallel = options.cpus)
        model_result.append( ('Ours', pred ) )

        if isinstance(options.missing[i], float) and options.missing[i] == 0:
            # only output when doing map infernece, not mmap
            pred_logmass = fast_log_mass(model, pred)
            print('S{}, Ours pred logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format(i, *logmass_statistic(pred_logmass) ))

        myclock.ring('Ours predict')
        result.append(model_result)
    return result
