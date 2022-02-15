import os, json
import numpy as np
from pdb import set_trace
from copy import deepcopy

from contcnet import nn_conf
from core.tinylib import logmass_statistic, evaluate_result
from utmLib.clses import Timer, MyObject
from utmLib import utils, shell
from utmLib.parmapper import Xmap
from Backends import HDF5

class WrapperRNADE:
    def fit(self, train_data, nn_conf, options, with_pid = False):
        if with_pid:
            extra = '_p{}'.format(os.getpid())
        else:
            extra = ''
        prefix = '{}{}'.format(options.name, extra)

        train_file = prefix + '.train'
        train_path = '{}/{}'.format(options.cache_dir, train_file)
        f = HDF5(options.cache_dir, train_file)
        f.write([], '/train/data', train_data.astype(np.float32))
        del f

        param_file = prefix + '.train_param'
        param_path = '{}/{}'.format(options.cache_dir, param_file)
        with open(param_path, 'w') as f:
            json.dump(nn_conf.__dict__, f)

        if not with_pid and options.dir != '':
            save_dir = options.dir
        else:
            save_dir = options.cache_dir

        out_file = prefix + '.rnade.model'
        out_path = '{}/{}'.format(save_dir, out_file)
        cmd = 'python2 -u rnade_release/orderlessNADE.py'

        shell.bash('{} train {}.hdf5 {} {}'.format(cmd, train_path, param_path, out_path), verbose=False)
        self.nade_path = out_path
        self.prefix = prefix
        self.cmd = cmd
        self.cache = options.cache_dir

        os.remove(train_path + '.hdf5')
        os.remove(param_path)
        return self

    def train_success(self):
        return os.path.exists(self.nade_path)

    def predict(self, test, N, parallel = 1):
        test_file = self.prefix + '.test'
        test_path = '{}/{}'.format(self.cache, test_file)
        np.savetxt(test_path, test, fmt = '%f', delimiter = ',')

        out_file = self.prefix + '.pred'
        out_path = '{}/{}'.format(self.cache, out_file)
        shell.bash('{} pred {} {} {} {} {}'.format(self.cmd, self.nade_path, \
            test_path, N, parallel, out_path), verbose = False)
        ret = np.loadtxt(out_path, delimiter= ',' , dtype = np.float32)

        os.remove(test_path)
        os.remove(out_path)
        return ret

    def mass(self, test):
        test_file = self.prefix + '.test.mass'
        test_path = '{}/{}'.format(self.cache, test_file)
        np.savetxt(test_path, test, fmt = '%f', delimiter = ',')

        out_file = self.prefix + '.mass'
        out_path = '{}/{}'.format(self.cache, out_file)
        shell.bash('{} mass {} {} {}'.format(self.cmd, self.nade_path, test_path, out_path), verbose = False)
        ret = np.loadtxt(out_path, delimiter= ',')

        os.remove(test_path)
        os.remove(out_path)
        return ret

def _tune_procedure(arg, train, test, query, ideal, option_info, conf):
    i, (k,wd,lr) = arg
    name, optdir, cache_dir, sample_size = option_info
    mini_option = MyObject()
    mini_option.name = name
    mini_option.dir = optdir
    mini_option.cache_dir = cache_dir

    myconf = deepcopy(conf)
    myconf.clean_mode = True
    myconf.ncomps = k
    myconf.wd = wd
    myconf.lrate = lr

    model = WrapperRNADE().fit(train, myconf, mini_option, with_pid=True)
    if model.train_success():
        pred = model.predict(test, sample_size, parallel=1)
        perf = evaluate_result(ideal, pred, query, output_var=1)
        os.remove(model.nade_path)
    else:
        perf = (np.inf, 10)
    return perf, i

def tune_and_fit(train, valid, masked_valid, options, verbose=True):
    full_train = np.vstack([train, valid])
    masked, qvar = masked_valid

    K = [2, 5, 10, 20]
    wd = [0.1, 0.01, 0.001, 0]
    lrate = [0.05, 0.025, 0.0125]
    # too large learning rate in our case, rande fails training for sdd (/10 by sdd)
    lrate = [r/2 for r in lrate]

    conf = deepcopy(nn_conf)
    conf.clean_mode = False
    conf.pre_epoch = nn_conf.pre_train[1]
    conf.name = options.name
    conf.real_batch_size = max(conf.batch_size, int(train.shape[0]/conf.batch_num)-5)
    conf.num_batch = int(train.shape[0] / conf.real_batch_size)

    params = list(utils.product(K, wd, lrate))
    if verbose:
        print('Size of hyper-params: {}'.format(len(params)))

    pool_size = min(len(params), options.cpus)
    option_info = (options.name, options.dir, options.cache_dir, options.sample_size)
    extra = (train, masked, qvar, valid, option_info, conf)
    tune_result = list(Xmap( _tune_procedure, list(enumerate(params)), args=extra, N=pool_size, progress=True))
    tune_result.sort()
    shell.bash('rm -rf ./rnade_release/output/')

    # determine best idx
    b_rmse, b_std = tune_result[0][0]
    best_val = 2.0
    idx = None
    N = max(5, int(len(params)*0.1 + 1))
    for perf, i in tune_result[0:N]:
        r_rmse = perf[0] / b_rmse
        r_std = perf[1] / b_std
        val = r_rmse * r_std
        if val < best_val:
            best_val = val
            idx = i

    k, wd, lr = params[idx]
    print('#comps:{} weight decay:{} lrate:{}'.format(*params[idx]))

    conf.ncomps = k
    conf.wd = wd
    conf.lrate = lr

    # make sure retrain successful
    while 1:
        m = WrapperRNADE().fit(full_train, conf, options, with_pid=False)
        if m.train_success():
            break
        else:
            conf.lrate = conf.lrate / 2.0
    return m

def run_exp(dataset, options):
    myname = 'RNADE'
    np.random.seed(options.seed)
    print(f'Run {myname} ....')

    train, valid, test_set = dataset
    full_train = np.vstack([train, valid])
    myclock = Timer()
    model_file = '{}/rnade.model'.format(options.dir)

    try:
        m = utils.pkload(model_file)
        m.nade_path = '{}/{}.rnade.model'.format(options.dir, options.name)
        print('Load pretrained rnade model.')
    except:
        m = tune_and_fit(train, valid, options.valid_extra, options)
        if options.dir != '':
            utils.pkdump(m, model_file)
    myclock.ring(f'{myname} fit')

    train_logmass = m.mass(full_train)
    test_logmass  = m.mass(options.gt)
    print('{} train logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format(myname, *logmass_statistic(train_logmass) ))
    print('{} test  logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format(myname, *logmass_statistic(test_logmass) ))
    myclock.ring(f'{myname} logmass computation')

    result = []
    for i, _ in enumerate(options.query_var):
        model_result = []
        test = test_set[i].copy()

        pred =  m.predict(test, options.sample_size, parallel=options.cpus )
        model_result.append( (myname, pred) )
        pred_logmass = m.mass(pred)
        if isinstance(options.missing[i], float) and options.missing[i] == 0:
            print('S{}, {} pred logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format(i, myname, *logmass_statistic(pred_logmass) ))
        myclock.ring(f'{myname} predict')

        result.append(model_result)

    return result
