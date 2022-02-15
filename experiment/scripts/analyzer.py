import argparse
import numpy as np
from pdb import set_trace
from sklearn.decomposition import PCA
import importlib

from core.tinylib import load_exp_conf, analyze_correlation, MinMaxScaler
from utmLib import utils


def high_corr_detection(data, exclude_vars, thresh = 0.98):
    # high correlated variable detection
    N, D = data.shape
    var_corr = analyze_correlation(data)

    hc_vars = []
    for idx in utils.halfprod(range(D)):
        v = var_corr[idx]
        if v > thresh:
            hc_vars.append( (idx,v) )

    if len(hc_vars) > 0:
        print("High correlated vars:")
        for i, item in enumerate(hc_vars):
            if i > 0 and i % 5 == 0:
                print('')
            print('{}:{:.4f}'.format(*item), end = ' ')
        print('')
    else:
        print('No highly correlated vars.')

    if len(hc_vars) > 0:
        elims = set()

        # give elimination suggestion
        for item in hc_vars.copy():
            (a,b), _ = item
            flag1 = a in exclude_vars
            flag2 = b in exclude_vars
            if flag1 + flag2 == 2:
                print('Warning, non-elim variable correlated.')
                hc_vars.remove(item)

            if flag1 + flag2 == 1:
                elims.add( item[0][int(flag1)] )
                hc_vars.remove(item)

        for item in hc_vars.copy():
            (a,b), _ = item
            if a in elims or b in elims:
                hc_vars.remove(item)

        while len(hc_vars) > 0:
            counter = np.zeros(shape = (D,))
            for (a,b), _ in hc_vars:
                counter[a] += 1
                counter[b] += 1
            idx = np.argsort(counter)[-1]
            elims.add(idx)
            for item in hc_vars.copy():
                (a,b), _ = item
                if a == idx or b == idx:
                    hc_vars.remove(item)
        print('Suggested elim vars:\n{}'.format(elims))

def pca_analysis(data):
    N, D = data.shape
    obj = PCA().fit(data)
    print('Variance explained for projected components:')
    for i, v in enumerate(obj.explained_variance_ratio_):
        if (i+1) % 10 == 0:
            print('')
        print('{:2.3f}%, '.format(v*100), end = '')
    print('')
    acc_sum = []
    S = 0
    for v in obj.explained_variance_ratio_:
        S += v
        acc_sum.append(S)

    acc_sum = np.array(acc_sum)*100
    int_pct = [90, 92, 95, 97, 98, 99, 99.5]
    for p in int_pct:
        left = np.sum(acc_sum>p) - 1
        num_p = D - left
        print('{:.2f}% : {}/{} = {:2.2f}% vars'.format(p,num_p,D, num_p/D*100))
    return

def main(args):
    options = load_exp_conf(args.in_file)
    this_module = importlib.import_module('loaders.{}'.format(options.loader_name))
    raw = this_module.load_data(options)
    print("Dataset size: {}".format(raw.shape))

    exclude_vars = list(map(int,args.v.split(',')))
    if (options.scaler is not None) and (not args.no_scaler):
        raw = MinMaxScaler().fit_transform(raw)

    # basic information of each attribute
    N, D = raw.shape
    Nv = [np.unique(raw[:,i]).size for i in range(D)]
    var = [np.var(raw[:,i]) for i in range(D)]
    corr = np.sum(analyze_correlation(raw), axis = 0)

    for i in range(D):
        print('{:3d} - corr {:2.5f} variance {:.5f} #values {}'.format(i, corr[i] ,var[i], Nv[i]))

    print('corr     rank {}'.format(list(np.argsort(corr))))
    print('variance rank {}'.format(list(np.argsort(var))))
    print('#values  rank {}'.format(list(np.argsort(Nv))))

    high_corr_detection(raw, exclude_vars)
    pca_analysis(raw)
    return

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = "Analyze the data", formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('in_file', type = str, help = "experiment configuration file")
    parser.add_argument('-v', type = str, help = "variable that not considered elimination when highly correlated with others", default = '-1')
    parser.add_argument('-ns', dest = 'no_scaler', action = 'store_true', help = "don't use scaler on data")
    args = parser.parse_args()
    main(args)
