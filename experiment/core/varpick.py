import numpy as np
from functools import partial
from pdb import set_trace

from utmLib import utils
from .tinylib import analyze_correlation


def feature_rank(X, k=None):
    # using PCA's k component as a feature selector
    X = X.T # this code is for column, make it support row-wise
    M, _ = X.shape

    if k is None:
        k = int(M * 0.8)
    assert(k <= M)

    x_mu = np.mean(X,axis=1).reshape(M,1)
    W = X-x_mu
    A = np.dot(W,W.T)
    w,v = np.linalg.eig(A)

    idx = range(M);	tmp= list(zip(idx,list(w)))
    tmp.sort(key=lambda x:x[1],reverse=True)
    eigV = np.zeros((M,k))
    for i in range(k):
        idx = tmp[i][0]
        eigV[:,i] = v[:,idx]

    distProb = []
    for i in range(M):
        row = eigV[i,:]
        prob = np.mean(row**2)
        distProb.append(prob)

    rank = np.argsort(distProb)
    return rank, distProb

def variance_methods(data, num_thresh, corr_thresh, exclude = None, mode = 'most'):
    # corr_thresh is not used here, just for API compatibility

    assert(mode in ['most', 'least', 'mix', 'random'])
    if exclude is None:
        exclude = []

    _, D = data.shape
    var_rank, weight = feature_rank(data)
    candidates = np.array(utils.notin(var_rank, exclude))

    num_r, num_N =  num_thresh
    N_cs = max(int(np.round(D*num_r)+1), num_N)

    if mode == 'most':
        cond = candidates[-N_cs:]
    if mode == 'least':
        cond = candidates[0:N_cs]
    if mode == 'mix':
        idx = np.round(np.linspace(0, len(candidates)-1, num = N_cs))
        idx = idx.astype(np.int32)
        cond = candidates[idx]
    if mode == 'random':
        idx = np.random.choice(D, replace=False, p=weight)
        cond = candidates[idx]

    return list(cond)


def max_mincorr(data, num_thresh, corr_thresh, exclude = None, balance = True):
    if exclude is None:
        exclude = []

    _,D = data.shape
    var_corr = analyze_correlation(data)

    cond = []
    leaf = list(range(D))
    corr = np.array([0.0 for _ in leaf])

    # at most num_r%, and at least num_N conditional variables
    num_r, num_N =  num_thresh
    N_cs = max(int(np.round(D*num_r)+1) , num_N)

    while True:
        if len(cond) == N_cs or np.min(corr[leaf]) > corr_thresh:
            break

        score = []
        for x in leaf:
            if x in exclude:
                s = -1
            else:
                new_leaf = leaf.copy()
                new_leaf.remove(x)
                inc_avg = np.mean(var_corr[x, new_leaf])
                new_mincorr = np.min(corr[new_leaf] + var_corr[x, new_leaf])
                if balance:
                    s = inc_avg * new_mincorr
                else:
                    s = new_mincorr
            score.append(s)

        ind = np.argmax(score)
        assert(score[ind] >= 0), "Too many exclude"
        x = leaf.pop( ind )
        cond.append(x)
        corr += var_corr[x,:]

    return cond


least_var = partial(variance_methods, mode = 'least')
mix_var = partial(variance_methods, mode = 'mix')
most_var = partial(variance_methods, mode = 'most')
hard_max_mincorr = partial(max_mincorr, balance = 0)
soft_max_mincorr = partial(max_mincorr, balance = 1)
random_var = partial(variance_methods, mode = 'random')

most_var._name_ = 'most_var'
hard_max_mincorr._name_ = 'max_mincorr'
soft_max_mincorr._name_ = 'soft_max_mincorr'
random_var._name_ = 'random_var'
mix_var._name_ = 'mix_var'
least_var._name_ = 'least_var'