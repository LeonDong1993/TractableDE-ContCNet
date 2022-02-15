# from __future__ import print_function, division
import argparse, importlib, os
import numpy as np
from pdb import set_trace

import tinylib
from transforms import *
from utmLib import utils, clses, sci
utils.require_verison(3, 6, 'ge')

def high_corr_var_detection(data, thresh = 0.98):
    D = data.shape[1]
    var_corr = tinylib.analyze_correlation(data)

    hc_vars = []
    for idx in utils.halfprod(range(D)):
        v = var_corr[idx]
        if v > thresh:
            hc_vars.append( (idx,v) )

    if len(hc_vars) > 0:
        print("High correlated vars detected! (elimination this by preprocessing in dataloader suggested)")
        for i, item in enumerate(hc_vars):
            if i > 0 and i % 5 == 0:
                print('')
            print('{}:{:.4f}'.format(*item), end = ' ')
        print('')

    return

def prepare_data(raw, options):

    def determine_size(total, size_const):
        if size_const > 1:
            ret = int(size_const)
        else:
            ret = int(total * size_const)
        return ret

    # train, valid, test split
    if isinstance(raw, tuple):
        # train/test is pre-determined
        raw_train, raw_test = raw
        if options.shuffle:
            np.random.shuffle(raw_train)
            np.random.shuffle(raw_test)

        nvalid = determine_size(raw_train.shape[0], options.valid_size)
        ntest = determine_size(raw_test.shape[0], options.test_size)
        train = raw_train[0 : -nvalid]
        valid = raw_train[-nvalid :]
        test = raw_test[0:ntest]

    else:
        if options.shuffle:
            np.random.shuffle(raw)

        N = raw.shape[0]
        ntest = determine_size(N, options.test_size)
        nvalid = determine_size(N, options.valid_size)
        ntrain = N - ntest - nvalid

        i = 0
        train = raw[i:(i+ntrain),:]

        i += ntrain
        valid = raw[i:(i+nvalid),:]

        i += nvalid
        test = raw[i:(i+ntest),:]

    if options.label:
        # split label from data and save it into options
        train_label = train[:, -1].astype(int)
        train = train[:, :-1]
        valid_label = valid[:, -1].astype(int)
        valid = valid[:, :-1]
        test_label = test[:, -1].astype(int)
        test = test[:, :-1]
        options.data_label = (train_label, valid_label, test_label)

    visible = np.vstack([train, valid])
    # scale the dataset
    if options.scaler is not None:
        options.scaler.fit(visible)
        train = options.scaler.transform(train)
        valid = options.scaler.transform(valid)
        test = options.scaler.transform(test)
        visible = np.vstack([train, valid])

    # do data transformation (PCA, CHD, VAE, etc.)
    if options.transform is not None:
        # save the original ground truth
        options.ori_gt = test
        # options.ori_data = (train, valid, test)

        data_digest = sci.hash_array(visible)
        name = '{}_{}_{}.tsfm'.format(options.name, options.transform, data_digest)
        cache_file = '{}/{}'.format(options.cache_dir, utils.str_clean(name, '', '=() '))

        try:
            ret = utils.pkload(cache_file)
            options.transform = ret
            print('Load pretrained transform instance.')
        except:
            options.transform.fit(visible)
            utils.pkdump(options.transform, cache_file)

        # transform the data
        train = options.transform.transform(train)
        valid = options.transform.transform(valid)
        test = options.transform.transform(test)
        visible = np.vstack([train, valid])

        options.rec_gt = options.transform.inverse_transform(test)
        print('Test rebuild RMSE: {}'.format(tinylib.evaluate_result(options.rec_gt, options.ori_gt)))

    # check high corr between pair of vars
    high_corr_var_detection(visible)
    # record all fixed query vars, we will nerver make these variables as X vars if possible
    exclude = []
    for item in options.query:
        if isinstance(item, list):
            exclude.extend(item)
        else:
            assert isinstance(item, float)
    exclude = list(set(exclude))
    options.exclude = exclude

    if len(exclude) > int(0.90 * train.shape[1]):
        print('90%+ variables are excluded from being X, disable this feature')
        options.exclude = []
    elif len(exclude) > int(0.70 * train.shape[1]):
        print('70%+ variables are excluded from being X.')

    # take care of query missing setting simplification
    if not options.cross_mode:
        assert len(options.query) == len(options.missing)
    else:
        lQ = len(options.query)
        lM = len(options.missing)
        tmp = utils.product( range(lQ), range(lM) )
        qidx, midx = tuple(zip(*tmp))
        newQ = [options.query[i] for i in qidx]
        newM = [options.missing[i] for i in midx]
        options.query = newQ
        options.missing = newM

    # create the test dataset
    N_setting = len(options.query)
    options.gt = test
    options.query_var = []
    test_set = []

    for i in range(N_setting):
        masked, qvar, _ = tinylib.mask_dataset(test, options.query[i], options.missing[i])
        options.query_var.append(qvar)
        test_set.append(masked)

    # process the valid dataset
    mask_valid = np.zeros_like( valid )
    valid_query = [None] * valid.shape[0]
    selection = np.random.randint(N_setting, size = valid.shape[0])
    for i in range(N_setting):
        filter = selection == i
        idxes = np.where(filter == True)[0]
        masked, qvar, _ = tinylib.mask_dataset(valid[filter, :], options.query[i], options.missing[i])
        mask_valid[filter, :] = masked
        for j,k in enumerate(idxes):
            valid_query[k] = qvar[j]
    options.valid_extra = (mask_valid, valid_query)

    dataset = (train, valid, test_set)
    return dataset


def main(args):
    env_flag = os.environ['OPENBLAS_NUM_THREADS']
    assert(env_flag == '1'), "Please init the envs first."
    clock = clses.Timer()
    options = tinylib.load_exp_conf(args.exp_file)
    options.dir = args.dir
    if args.kv != '':
        over_writes = args.kv.split(';')
        for item in over_writes:
            k,v = item.split('<-')
            k = k.strip()
            options[k] = eval(v)
            if k not in options.__dict__:
                print('add new item {}={} to options'.format(k,v))

    print("Experiment Configuration:")
    options.show()
    np.random.seed(options.seed)

    # load data, split and transform it
    this_module = importlib.import_module('loaders.{}'.format(options.loader_name))
    raw_data = this_module.load_data(options)
    if isinstance(raw_data, tuple):
        train, test = raw_data
        print('Train data size:{}'.format(train.shape))
        print('Test  data size:{}'.format(test.shape))
    else:
        print('Raw data size:{}'.format(raw_data.shape))
    dataset = prepare_data(raw_data, options)
    clock.ring('Data preparation')

    # save ground truth predictions and query vars for each setting
    if options.dir != '':
        np.savetxt('{}/{}.gt'.format(options.dir, options.name), options.gt, fmt = '%f', delimiter=',')
        for i,item in enumerate(options.query_var):
            np.savetxt('{}/s{}.qv'.format(options.dir, i), np.array(item) , fmt = '%d', delimiter=',')
        if options.transform is not None:
            np.savetxt('{}/{}.rec_gt'.format(options.dir, options.name), options.rec_gt, fmt = '%f', delimiter=',')
            np.savetxt('{}/{}.ori_gt'.format(options.dir, options.name), options.ori_gt, fmt = '%f', delimiter=',')

    # define a function for manage all the results
    def merge_results(item, container):
        for i, results in enumerate(item):
            for name, predict in results:
                # evaluation
                perf = tinylib.evaluate_result(options.gt, predict, options.query_var[i])
                if options.transform is not None:
                    rec_pred = options.transform.inverse_transform(predict)
                    # perf_rec = tinylib.evaluate_result(options.rec_gt, rec_pred)
                    perf_ori = tinylib.evaluate_result(options.ori_gt, rec_pred)
                    # perf = (perf, perf_rec, perf_ori)
                    perf = (perf, perf_ori)

                # save and print temporary resutls
                print('-- Setting {} -- {}:{}'.format(i, name, perf))
                container[i].append((name,perf))

                # save prediction results
                if options.dir != '':
                    np.savetxt('{}/{}_s{}.pred'.format(options.dir, name, i), predict, fmt = '%f', delimiter=',')
                    if options.transform is not None:
                        np.savetxt('{}/{}_s{}.rec_pred'.format(options.dir, name, i), rec_pred, fmt = '%f', delimiter=',')

    # run the models
    all_result = [ list() for _ in options.query_var]
    for model_name in options.models:
        this_module = importlib.import_module('models.{}'.format(model_name))
        predicted = this_module.run_exp(dataset,options)
        merge_results(predicted, all_result)

    # find max length of model names
    max_name_length = 0
    for name, _ in all_result[0]:
        max_name_length = max(max_name_length, len(name))
    format_str = '{:>%ds} {}' % max_name_length

    # display detailed results
    for i, _ in enumerate(options.query_var):
        print('\n', end = "")
        print('Setting {} -- Query:{} Missing:{}'.format(i+1, options.query[i], options.missing[i]))
        results = all_result[i]
        for name, perf in results:
            print(format_str.format(name, perf))

    clock.ring('All done')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description = "Continuous Cutset Network experiment main script", \
            formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('exp_file', type=str, help = "Experiment config file")
    parser.add_argument('-dir', type=str, help = "directory name for save results", default = '')
    parser.add_argument('-kv',  type=str, help = "Overwrites the default options", default = '')
    args = parser.parse_args()
    main(args)
