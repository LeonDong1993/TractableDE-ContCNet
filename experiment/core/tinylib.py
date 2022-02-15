import numpy as np
import configparser, os
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from sklearn.decomposition import PCA
from pdb import set_trace

from utmLib import utils
from utmLib.ml.potential import CLG
from transforms import *

def pca_analysis(data, percentiles):
    D = data.shape[1]
    obj = PCA().fit(data)
    acc_sum = [] ; S = 0
    for v in obj.explained_variance_ratio_:
        S += v
        acc_sum.append(S)
    acc_sum = np.array(acc_sum)

    ret = []
    for p in percentiles:
        left = np.sum(acc_sum > p) - 1
        num_p = D - left
        ret.append(num_p)
    return ret

def analyze_correlation(data):
    # return the pairwise P-correlation of variables
    _,D = data.shape
    corr = np.zeros((D,D), dtype=float)
    for i,j in utils.halfprod(range(D)):
        corr[i,j] = CLG.corr_coef(data[:,(i,j)])
        corr[j,i] = corr[i,j]
    return corr

def compute_rmse(a, b):
    assert(a.shape == b.shape)
    sse = np.sum(np.square(a-b))
    mse = sse / a.size
    rmse = np.sqrt(mse)
    return rmse

def evaluate_result(truth, estimated, query = None, output_var = False):
    # evaluate the average rmse of query variables, missing is not considered here
    N, _ = truth.shape
    rmse = []

    if query is None:
        query = [slice(None)] * N

    for i in range(N):
        idx = query[i]
        rmse.append(compute_rmse(truth[i,idx], estimated[i,idx] ))
    avg_rmse = np.mean(rmse)
    if not output_var:
        return avg_rmse
    else:
        std_rmse = np.std(rmse)
        return avg_rmse, std_rmse

def logmass_statistic(logmass):
    # return the 25%, median, 75% percentile and average of logmass
    p25 = np.percentile(logmass, 25)
    median = np.median(logmass)
    p75 = np.percentile(logmass, 75)
    average = np.mean(logmass)
    return (p25, median, p75, average)

def print_array(X):
    print('-------------------------------')
    for row in X:
        print(','.join(row.astype(str)))
    return

def read_ini(fpath, section = 'expconf'):
    parser = configparser.ConfigParser()
    parser.read(fpath)
    parsed_conf = dict(parser[section])
    return parsed_conf

def load_exp_conf(fpath):
    parsed_conf = read_ini(fpath)

    if 'include' in parsed_conf:
        extra_ini = parsed_conf['include'].split(',')
        path_frag = fpath.split('/')
        for item in extra_ini:
            path_frag[-1] = item
            extra_fpath = '/'.join(path_frag)
            for k,v in read_ini(extra_fpath).items():
                if k not in parsed_conf:
                    parsed_conf[k] = v
        del parsed_conf['include']

    conf_dict = {}
    for k,v in parsed_conf.items():
        conf_dict[k] = eval(v)
    options = utils.dict2obj(conf_dict)

    # take care of root dir simplification
    if options.root_dir == 'auto':
        file_path = os.path.realpath(__file__)
        up2_dir = file_path.split('/')[0:-3]
        options.root_dir = '/'.join(up2_dir)

    return options

def _do_mask_(data, query, missing):
    masked = data.copy()
    unknown = np.concatenate([query,missing], axis = 1)

    for i, r in enumerate(masked):
        u = unknown[i]
        r[u] = np.nan
    return masked

def mask_dataset(data, Q, M):
    # create masked dataset give query and missing setting
    N, D = data.shape

    if isinstance(Q, list):
        # fix query var
        query = [Q] * N
    else:
        qsize = int(np.round(D*Q))
        query = [np.random.choice(D, size=qsize, replace=False) for i in range(N)]

    msize = int(np.round(D*M))
    missing = []
    for i in range(N):
        pool = utils.notin(range(D), query[i])
        missing.append( np.random.choice(pool, size=msize, replace=False) )

    masked = _do_mask_(data, query, missing)
    return masked, query, missing

# following function is experiemental, have known issues when Qr and Mr is None
# do not use this function for now
def mask_dataset_ex(data, Q, M, cond_var):
    N, D = data.shape
    Qs, Qr = Q
    Ms, Mr = M

    leaf_var = utils.notin(range(D), cond_var)
    if isinstance(Qs, list):
        assert( Qr is None )
        query = [Qs] * N
    else:
        total_qsize = int(np.round(D*Qs))
        if Qr is None:
            cond_qsize = [np.random.choice(total_qsize + 1) for i in range(N)]
        else:
            cond_qsize = [int(np.round(total_qsize * Qr))] * N

        query = []
        for i in range(N):
            qs_cond = cond_qsize[i]
            qs_leaf = total_qsize - qs_cond
            qvar_cond = np.random.choice(cond_var, size=qs_cond, replace=False)
            qvar_leaf = np.random.choice(leaf_var, size=qs_leaf, replace=False)
            qvar = np.concatenate([qvar_cond, qvar_leaf])
            query.append(qvar)

    total_msize = int(np.round(D*Ms))
    if Mr is None:
        cond_msize = [np.random.choice(total_msize + 1) for i in range(N)]
    else:
        cond_msize = [int(np.round(total_msize * Mr))] * N

    missing = []
    for i in range(N):
        ms_cond = cond_msize[i]
        pool = utils.notin(cond_var, query[i])
        mvar_cond = np.random.choice(pool, size=ms_cond, replace=False)
        ms_leaf = total_msize - ms_cond
        pool = utils.notin(leaf_var, query[i])
        mvar_leaf = np.random.choice(pool, size=ms_leaf, replace=False)
        mvar = np.concatenate([mvar_cond, mvar_leaf])
        missing.append(mvar)

    masked = _do_mask_(data, query, missing)
    return masked, query, missing
