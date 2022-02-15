# python 3.8 is suggested

import numpy as np
from copy import deepcopy
from pdb import set_trace

from utmLib import utils
from utmLib.clses import Timer
from utmLib.parmapper import Xmap
from tinylib import evaluate_result, logmass_statistic

from spnflow.algorithms.mpe import mpe
from spnflow.structure.leaf import Gaussian
from spnflow.learning.wrappers import learn_estimator
from spnflow.algorithms.sampling import sample
from spnflow.algorithms.inference import log_likelihood

# spnflow is originated from early version of spflow, and therefore no marginalization operation implemented
# the following is marginalize code is authored by Alejandro Molina on github
# I made a few changes to comply the API of spnflow package

from spnflow.structure.pruning import prune
from spnflow.structure.node import Sum, assign_ids
from spnflow.structure.leaf import Leaf
from spnflow.utils.validity import assert_is_valid

def marginalize(node, keep):
    # keep must be a set of features that you want to keep

    keep = set(keep)

    def marg_recursive(node):
        new_node_scope = keep.intersection(set(node.scope))

        if len(new_node_scope) == 0:
            # we are summing out this node
            return None

        if isinstance(node, Leaf):
            if len(node.scope) > 1:
                raise Exception("Leaf Node with |scope| > 1")

            return deepcopy(node)

        C = list()
        S = list()
        if isinstance(node, Sum):
            W = list()
            newNode = node.__class__(weights = W, children = C, scope = S)
            newNode.weights.extend(node.weights)
        else:
            newNode = node.__class__(children = C, scope = S)

        for c in node.children:
            new_c = marg_recursive(c)
            if new_c is None:
                continue
            newNode.children.append(new_c)

        newNode.scope.extend(new_node_scope)
        return newNode

    newNode = marg_recursive(node)
    assign_ids(newNode)
    newNode = prune(newNode)
    assert_is_valid(newNode)

    return newNode

class WrapperSPN:
    def fit(self, train, **kwargs):
        N,D = train.shape
        para_type  = [Gaussian for i in range(D)]
        self.model = learn_estimator(train, para_type, **kwargs)
        return self

    def predict(self, X, query, N_sample = 0, parallel = 1):
        if len(query) == X.shape[0] and hasattr(query[0], '__iter__'):
            pass
        else:
            query = [query] * (X.shape[0])
        if parallel == 1:
            ret = [self._predict_(x, query[i], N_sample) for i,x in enumerate(X)]
        else:
            ret = list( Xmap(self._predict_, list(zip(X,query)), args=(N_sample,), N=parallel, chunksize=-1, star=True) )
        return np.array(ret)

    def _predict_(self, x, query, N_sample = 0):
        nan_idx = np.where(np.isnan(x))[0]
        if N_sample == 0:
            # marginalization (approxiamated) then mpe
            missing = utils.notin(nan_idx, query)
            non_missing = utils.notin(range(x.size), missing)
            marg_spn = marginalize(self.model, non_missing)
            v = mpe(marg_spn, x.reshape(1,-1))[0]
        else:
            # increase sample size if large missing
            nan_ratio = len(nan_idx) / x.size
            N_sample *= (1 + 4 * nan_ratio)
            S = np.broadcast_to(x.reshape(1,-1), (int(N_sample), x.size))
            samples = sample(self.model, S)
            mass = self.mass(samples)
            best = np.argmax(mass)
            v = samples[best]
        return v

    def mass(self, X):
        ret = log_likelihood(self.model, X)
        return ret.flatten()

def _tune_procedure(arg, train, test, query, ideal):
    i, (ls, rs, cs) = arg
    m = WrapperSPN().fit(train, min_rows_slice = ls, split_rows = rs, split_cols = cs, verbose = False)
    pred = m.predict(test, query, parallel = 1)
    perf = evaluate_result(ideal, pred, query, output_var=1)
    return perf, i

def tune_and_fit(train, valid, masked_valid, options, verbose=True):
    full_train = np.vstack([train, valid])
    masked, qvar = masked_valid

    min_leaf_size = [50,100,150,200,250,300,400,500]
    row_split = ['kmeans', 'gmm', 'rdc']
    col_split = ['rdc', 'gvs']

    params = list(utils.product(min_leaf_size, row_split, col_split))
    if verbose:
        print('Size of hyper-params: {}'.format(len(params)))

    pool_size = min(len(params), options.cpus)
    tune_result = list(Xmap( _tune_procedure, list(enumerate(params)), args=(train,masked,qvar,valid), N=pool_size, progress=True))
    tune_result.sort()

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

    ls, rs, cs = params[idx]
    print('Min leaf size:{} row split:{} col split:{}'.format(*params[idx]))
    m = WrapperSPN().fit(full_train, min_rows_slice = ls, split_rows = rs, split_cols = cs)
    return m

def run_exp(dataset, options):
    myname = 'spnflow'
    np.random.seed(options.seed)
    print(f'Run {myname} ....')

    train, valid, test_set = dataset
    full_train = np.vstack([train, valid])
    myclock = Timer()
    model_file = '{}/spn.model'.format(options.dir)

    try:
        m = utils.pkload(model_file)
        print('Load pretrained spn model.')
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
    for i,query in enumerate(options.query_var):
        model_result = []
        test = test_set[i].copy()

        pred =  m.predict(test, query, parallel=options.cpus )
        model_result.append( (myname, pred) )
        pred_logmass = m.mass(pred)
        if isinstance(options.missing[i], float) and options.missing[i] == 0:
            print('S{}, SPN pred logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format(i, *logmass_statistic(pred_logmass) ))
        myclock.ring(f'{myname} predict')

        # samples based
        # model_result.append( (f'{myname}-S', m.predict(test, query, N_sample = options.sample_size, parallel=options.cpus ) ) )
        # myclock.ring(f'{myname}-S predict')

        result.append(model_result)

    return result

