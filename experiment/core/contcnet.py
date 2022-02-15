############################################################################
# continuous cutset network implementation
# use fully connectted GBN as leaf model
# parameters are generated using neural networks
# pytorch used
# optimzation goal is log-mass
############################################################################

import time, os, warnings
import numpy as np
from pdb import set_trace
from functools import partial
from scipy.stats import multivariate_normal
from scipy.misc import derivative
from sklearn.mixture import GaussianMixture
from sklearn.model_selection import KFold
from numpy.linalg import det as mat_det

import torch
import torch.nn as nn
import torch.optim as optim
torch.set_num_threads(1)

import tinylib
from utmLib import utils
from utmLib.clses import MyObject, ProgressIndicator
from utmLib.parmapper import Xmap
from utmLib.ml.GBN import GBN
from utmLib.ml.graph import Graph

# nn default configuration object
nn_conf = MyObject()
nn_conf.device = 'cpu'
nn_conf.fsize = 50
nn_conf.max_LR = 1e-3
nn_conf.model = (3, 2.5) # number of stages and reduction_rate
nn_conf.pre_train = (4, 15) # N, epoches
nn_conf.var_thresh = 5e-3
nn_conf.learn_std = True
nn_conf.group_header = True
nn_conf.linear_header = False
nn_conf.batch_size = 100
nn_conf.batch_num = 50
nn_conf.init_epoch = 5
nn_conf.last_epoch = 5
nn_conf.max_epoch = 150
nn_conf.weight_decay = 1e-3
nn_conf.corr_thresh = 0.05
nn_conf.drop_prob = 0.0

# data batch index loader
def minibatch_index_generator(total, size, with_last = False):
    indices = np.arange(total)
    np.random.shuffle(indices)
    st = 0 ; ed = size
    while st <= total:
        if (ed <= total) or (with_last):
            yield indices[st:ed]
        st = ed
        ed += size

# multivariate normal
class MultivariateGaussain:
    def __init__(self):
        self.mass_correction = 1e-100
        self.logpdf = multivariate_normal.logpdf

    def fit(self, data, covfix = False):
        self.mu = np.mean(data, axis = 0)
        M = np.cov(data, rowvar = False, bias = False)
        if covfix:
            M = MultivariateGaussain.fix_cov(M)
        self.S = M
        return self

    def mass(self, X, logmode = False):
        try:
            ret = self.logpdf(X, mean = self.mu, cov = self.S, allow_singular=True)
        except Exception as e:
            warnings.warn("MultivariateGaussain mass computation error")
            if X.ndim == 2:
                ret = [-100] * X.shape[0]
                ret = np.array(ret)
            else:
                ret = -100

        if not logmode:
           ret = np.exp(ret) + self.mass_correction
        return ret

    @staticmethod
    def fix_cov(M, det_thresh = 1e-250, max_fix = 0.1):
        # fix the covariance matrix using binary search
        # max_fix = max( max_fix, np.max(0.5 * M.diagonal()) )
        def det_with_fix(matrix, eps):
            m = matrix.copy()
            np.fill_diagonal(m, m.diagonal() + eps)
            return m, mat_det(m)

        ret = M
        if mat_det(ret) < det_thresh:
            left = 0
            right = max_fix

            while 1:
                if abs(right - left) < 1e-4:
                    break
                mid = (left + right)/2.0
                m,d = det_with_fix(M, mid)
                if d >= det_thresh:
                    right = mid
                else:
                    left = mid

            m, d = det_with_fix(M, right)

            if d > 0:
                ret = m
            else:
                # cannot be fixed, return identity matrix
                ret = np.identity(M.shape[0])
                warnings.warn('Cannot fix the covariance matrix')

        return ret

    @staticmethod
    def GBN2MG(gbn):
        # convert gbn object to MultivariateGaussain object
        node_num = gbn.g.N
        mu = np.zeros(shape = (node_num, ))
        S = np.zeros(shape = (node_num, node_num))

        for i,nid in enumerate(gbn.g._topo_order_):
            prev_nodes = gbn.g._topo_order_[0:i]
            parents = gbn.g.V[nid].parents
            A, b, s = gbn.potential[nid].para

            if A is None:
                mu[nid] = b
                S[nid,nid] = s
            else:
                # support sparse gbn
                if len(parents) < len(prev_nodes):
                    ind_par = utils.notin(prev_nodes, parents)
                    parents = parents + ind_par
                    A = np.concatenate([A, np.zeros(len(ind_par))])

                mu[nid] = b + np.sum(A * mu[parents])
                Sp = S[np.ix_( parents, parents)]
                beta = A.reshape(-1,1)
                S[nid,nid] = s + beta.T @ Sp @ beta

                Sx = S[np.ix_(prev_nodes, parents)]
                cov_vec = Sx @ beta
                S[np.ix_([nid], prev_nodes)] = cov_vec.T
                S[np.ix_(prev_nodes, [nid])] = cov_vec

        obj = MultivariateGaussain()
        obj.mu = mu
        obj.S = S
        return obj

    @staticmethod
    def CLG(mu, sigma, var_idx, cond_idx):
        '''
        Description:
        -------------
        Compute the parameters of Conditional Linear Gaussian P(Y|X) given the
        parameters of Joint Gaussian distribution over Y and X

        Args:
        -----
        mu: array-like
            the mean vector of the joint gaussain
        sigma: array-like
            the covariance matrix of the joint gaussain
        var_idx: array-like
            the ids of Y variables, the order matters
        cond_idx: array-like, optional
            the ids of X variables, if None is given,
            it will be automatically set to Not(Y) in increasing order

        Returns:
        ---------
        1. the coef vector A (np.array)
        2. the bias vector B (np.array)
        3. the cov matrix S (np.array)
        '''

        if mu.size == 1:
            assert(sigma.size == 1)
            A = None
            B = float(mu)
            S = float(sigma)
        else:
            # if mat_det(sigma) <= 0:
                # sigma = MultivariateGaussain.fix_cov(sigma)
            if cond_idx is None:
                cond_idx = np.array( utils.notin(range(mu.size), var_idx) )
            mu = mu.reshape(-1,1)
            mu1 = mu[var_idx,:]
            mu2 = mu[cond_idx, :]
            s11 = sigma[np.ix_(var_idx, var_idx)]
            s12 = sigma[np.ix_(var_idx, cond_idx)]
            s21 = s12.T
            s22 = sigma[np.ix_(cond_idx, cond_idx)]
            # if mat_det(s22) <= 0:
                # s22 = MultivariateGaussain.fix_cov(s22)
            # A = s12.dot(np.linalg.inv(s22))
            # fix explicit calculation of inverse @ 09-25-21 15:05
            # s21 is s12.T, this solves A = s12 * inv(S22)
            # s22.T = s22
            A = np.linalg.lstsq(s22, s21, rcond=None)[0].T
            B = mu1 - A.dot(mu2)
            S = s11 - A.dot(s21)
        return A,B,S

    def rvs(self, N, evi = None):
        '''
        Description:
        -------------
        general samples from the multivariate normal distribution, partial evidence supported

        Args:
        -----
        N:int
            number of samples want to generate
        evi: None, tuple of (evi_var_ids, value_of_evi_var)
            can be a tuple contains the ids of evidence variable and its value

        Returns:
        ---------
        1. array of samples

        '''
        assert( N >=1 )

        if evi is None or len(evi[0]) == 0:
            full_samples = multivariate_normal.rvs(mean = self.mu, cov = self.S, size = N)
            if N == 1:
                full_samples = full_samples.reshape(1,-1)
        else:
            evi_idx, evi_val = evi
            var_idx = utils.notin(range(self.mu.size), evi_idx)
            A,B,S = MultivariateGaussain.CLG(self.mu, self.S, var_idx, evi_idx)
            evi_val = evi_val.reshape(-1,1)
            mu = A.dot(evi_val) + B
            # generate samples
            mu = mu.flatten()
            partial_samples = multivariate_normal.rvs(mean = mu, cov = S, size = N)
            partial_samples = partial_samples.reshape(N,-1)
            full_samples = np.zeros(shape = (N, self.mu.size))
            full_samples[:,var_idx] = partial_samples
            # set evidence
            for i,v in zip(evi_idx,evi_val):
                full_samples[:,i] = v

        return full_samples

    def predict(self, test, unknown):
        self._pred_cache_ = None
        ret = np.array( [self._predict_(x,unknown) for x in test] )
        del self._pred_cache_
        return ret

    def _predict_(self, x, unknown):
        # cache mechanism used for speed up
        if hasattr(self,'_pred_cache_'):
            cache_status = int(self._pred_cache_ is not None)
        else:
            cache_status = -1

        # cache_status = 1 if we have cache and it is filled
        # cache_status = 0 if we have cache but it is NOT filled
        # cache_status = -1 no cache

        if cache_status < 1:
            evi_idx = utils.notin(range(self.mu.size), unknown)
            A,B,S = MultivariateGaussain.CLG(self.mu, self.S, unknown, evi_idx)
            # fill cache if cache is presented
            if cache_status == 0:
                self._pred_cache_ = (evi_idx, A, B, S)
        else:
            # retrieve information from cache
            evi_idx,A,B,S = self._pred_cache_

        evi_val = x[evi_idx].reshape(-1,1)
        mu = A.dot(evi_val) + B
        mu = mu.flatten()
        ret = x.copy()
        ret[unknown] = mu
        return ret

    def marginalize(self, rv_ids):
        mu = self.mu[rv_ids]
        S = self.S[np.ix_(rv_ids, rv_ids)]
        obj = MultivariateGaussain()
        obj.mu = mu
        obj.S = S
        return obj

    @staticmethod
    def selftest():
        # a function used to test if the matrix is positive definite
        def is_pos_def(A):
            if np.array_equal(A, A.T):
                try:
                    np.linalg.cholesky(A)
                    return True
                except np.linalg.LinAlgError:
                    return False
            else:
                return False

        # test if x is the local maximum of function f
        def is_local_maximum(f, x, fdom, eps = 1e-3):
            N = x.size
            vmax = f(x)
            y = x.copy()
            for i in range(100):
                perturbation = np.random.randint(-N, N, len(fdom))
                y[fdom] = x[fdom] + perturbation * eps
                assert(f(y) <= vmax), "Not maximum"
            return 1

        # random generate the mu and cov of target MG
        N_vars = 5
        mu = np.random.rand(N_vars)
        while True:
            S  = np.random.rand(N_vars, N_vars)
            for i,j in utils.halfprod(range(N_vars)):
                S[i,j] = S[j,i]

            if is_pos_def(S):
                break

        mg = MultivariateGaussain()
        mg.mu = mu
        mg.S = S

        # test CLG and prediction function simutaneously
        samples = np.random.rand(100, N_vars)
        unknown = np.random.choice(N_vars, size = int(N_vars/2), replace = False)
        predicted = mg.predict(samples, unknown)
        for p in predicted:
            is_local_maximum(mg.mass, p, unknown)
        print('Passed prediction test')

        # test the rvs function
        x = predicted[0]
        evi_idx = utils.notin(range(N_vars), unknown)
        evi_val = x[evi_idx]
        samples = mg.rvs(100000, evi = (evi_idx, evi_val))
        mean_hat = np.mean(samples, axis = 0)
        print('Estimated:{} Expected:{}'.format( mean_hat[unknown], x[unknown] ))

# mixture of multivariate normal
class MixMG:
    def fit(self, data, n_components = -10, verbose = True):
        # n_components can be any non-zero integer
        # if n_components < 0, it means the maximum number of components for tuning
        # if n_components > 0, disable tuning, and using that number as target components

        assert(n_components != 0)
        if n_components < 0:
            # use cross validation procedure to automatically select best n
            fold_data = []
            kf = KFold(n_splits=5, shuffle=True)
            for tidx, vidx in kf.split(data):
                train = data[tidx, :]
                valid = data[vidx, :]
                fold_data.append( (train,valid) )

            cv_score = []
            listN = list( range(2, -n_components + 1 ) )
            for n in listN:
                tmp = [GaussianMixture(n_components=n, covariance_type = 'full').fit(t).score(v) for t,v in fold_data]
                cv_score.append(np.mean(tmp) - 0.1*np.std(tmp))

            cv_score = np.exp(cv_score)
            max_score = np.max(cv_score)
            cv_score -= max_score * 0.95
            tmp = np.where(cv_score > 0, listN, -n_components+1)
            n_components = np.min(tmp)

        if verbose:
            print('Fit a MixMG with {} components'.format(n_components))

        m = GaussianMixture(n_components= n_components, covariance_type = 'full').fit(data)
        self.models = []
        for i in range(n_components):
            mu = m.means_[i]
            sigma = m.covariances_[i]
            mg = MultivariateGaussain()
            mg.mu = mu
            mg.S = sigma
            self.models.append(mg)
        self.W  = m.weights_
        return self

    def mass(self, X):
        # X can be 2d or 1d array
        ret = 0
        for i, mg in enumerate(self.models):
            ret = ret + self.W[i] * mg.mass(X)
        return ret

    def rvs(self, N, evi):
        comp_ids = np.random.choice(range(self.W.size), size = N, p = self.W)
        val, idcounts = np.unique( comp_ids, return_counts=True)
        sample_batches = []
        for cid, count in zip(val,idcounts):
            samples = self.models[cid].rvs(count, evi)
            sample_batches.append(samples)
        ret = np.vstack(sample_batches)
        return ret

    def gradient(self, x, i):
        def _npd_(func, v, i):
            # numerical partial derivative
            def wrap_func(x):
                item = v.copy()
                item[i] = x
                return func(item)
            return derivative(wrap_func, v[i], dx = 1e-5)

        return _npd_(self.mass, x, i)

        # exact gradient suffers from inverse, give complete wrong solution
        # ret = 0
        # for i, mg in enumerate(self.models):
        #     vec = (mg.mu - x).reshape(-1,1)
        #     ret = ret + self.W[i] * np.linalg.inv(mg.S).dot(vec)
        # return ret.flatten()

    def marginalize(self, rv_ids):
        obj = MixMG()
        obj.models = [m.marginalize(rv_ids) for m in self.models]
        obj.W = self.W
        return obj

    def predict(self, X, query, max_iter = 0, parallel = 1):
        '''
        query can be either fixed (a single list) or
        dynamic (list of query var for each instace x in X)
        '''
        if len(query) == X.shape[0] and hasattr(query[0], '__iter__'):
            pass
        else:
            query = [query] * (X.shape[0])

        if parallel == 1:
            ret = [self._predict_(x, query[i], max_iter) for i,x in enumerate(X)]
        else:
            assert(parallel > 0)
            ret = list( Xmap(self._predict_, list(zip(X,query)), args=(max_iter,), N=parallel, star=True) )
        return np.array(ret)

    def _predict_(self, x, q, max_iter = 0):
        unknown = list(np.where(np.isnan(x))[0])
        missing = utils.notin(unknown, q)
        pred = x.copy()

        # mapping query vars onto marginalized distribution
        if len(missing) > 0:
            non_missing = utils.notin(range(x.size), missing)
            obj = self.marginalize(non_missing)
            idx = non_missing
            unknown = [idx.index(i) for i in q]
            x = x[idx]
        else:
            obj = self
            idx = list(range(x.size))
            unknown = q

        # find the peak of each component
        candidates = []
        for item in obj.models:
            p = item._predict_(x, unknown)
            m = obj.mass(p)
            candidates.append( (m,p) )

        # compute weighted peak
        c = 0
        for i, (m,p) in enumerate(candidates):
            c = c + obj.W[i] * p
        candidates.append( (obj.mass(c),c) )
        candidates.sort(key = lambda x:x[0], reverse=True)

        if max_iter <= 0:
            ret = candidates[0][1]
        else:
            n_iter = 0
            dec_rate = 0.3
            init_lrate = 0.1
            minimum_lrate = 1e-5
            grad_thresh = 10

            y = candidates[0][1].copy()
            unknown_ratio = len(unknown) / len(y)
            max_iter *= (1 + 4 * unknown_ratio)

            converged = False
            current_best = -np.inf
            G = np.zeros( (y.size,) )
            while not converged:
                n_iter += 1
                for i in unknown:
                    G[i] = obj.gradient(y,i)
                G = np.clip(G, -grad_thresh, grad_thresh)

                # Backtracking line search
                lrate = init_lrate
                init_mass = obj.mass(y)
                grad_norm_sqaure = np.linalg.norm(G) ** 2
                while lrate > minimum_lrate:
                    cur_mass = obj.mass( y+G*lrate )
                    if (cur_mass - init_mass) > (0.25 * lrate * grad_norm_sqaure) :
                        break
                    else:
                        lrate *= dec_rate

                if lrate > minimum_lrate:
                    y += G*lrate
                else:
                    converged = True

                if n_iter >= max_iter:
                    converged = True

                if np.max(np.abs(G)) < 1e-3:
                    converged = True

                if cur_mass > current_best:
                    current_best = cur_mass
                    ret = y

        pred[idx] = ret
        return pred

class LrateScheduler:
    def __init__(self, lr_max=0.1, init_scale=0.01, init_epoches=5, final_scale=0.01, final_epoches=55):
        self.lr_max = lr_max
        self.init_scale = init_scale
        self.init_epoches = init_epoches
        self.final_scale = final_scale
        self.final_epoch = final_epoches
        self.init_lr = lr_max * init_scale
        self.final_lr = lr_max * final_scale
        self.total_epoch = final_epoches + init_epoches

    def get_lrate(self,epoch):
        # linear warmup followed by cosine decay
        if epoch < self.init_epoches:
            lr = (self.lr_max - self.init_lr) * float(epoch) / self.init_epoches + self.init_lr
        elif epoch < self.total_epoch:
            lr = (self.lr_max - self.final_lr)*max(0.0, np.cos(((float(epoch) - self.init_epoches)/(self.final_epoch - 1.0))*(np.pi/2.0))) + self.final_lr
        else:
            lr = self.final_lr
        return lr

class BuildingBlock(nn.Module):
    def __init__(self, insize, outsize):
        super(BuildingBlock, self).__init__()

        layers = []
        layers.append( nn.Linear(insize, outsize) )
        layers.append( nn.BatchNorm1d(outsize) )
        layers.append( nn.ReLU() )
        self.encoder = nn.Sequential(*layers)

    def forward(self, X):
        return self.encoder(X)

# NN model used to generate the params for underlying MG
class MyNet(nn.Module):
    def __init__(self, nn_insize, node_parents, cf):
        super(MyNet, self).__init__()
        node_num = len(node_parents)
        stages, mr  = cf.model
        layer_size = [cf.fsize * (mr ** (stages - i)) for i in range(stages+1)]
        layer_size = list(map(int, layer_size))

        layers = list()
        szin = nn_insize
        for i,szout in enumerate(layer_size):
            layers.append( BuildingBlock(szin, szout) )
            if i < stages and cf.drop_prob > 0:
                layers.append(nn.Dropout(p = cf.drop_prob))
            szin = szout
        # layers.append(nn.ReLU())
        self.encoder = nn.Sequential(*layers)

        def construct_head(Nin, Nout):
            L = []
            if not cf.linear_header:
                L.append( nn.Linear(Nin, Nin) )
                L.append( nn.BatchNorm1d(Nin) )
                L.append( nn.ReLU() )
            L.append( nn.Linear(Nin, Nout) )
            header = nn.Sequential(*L)
            return header

        if nn_conf.group_header:
            # a simple greedy algorithm for merge multiple small header
            # into a larger header size less than node number
            header_size = []
            cur_sum = 0
            for n in node_parents:
                assert( n < node_num )
                if (cur_sum + n) > node_num:
                    header_size.append(cur_sum)
                    cur_sum = n
                else:
                    cur_sum += n
            if cur_sum > 0:
                header_size.append(cur_sum)
        else:
            header_size = [n for n in node_parents if n > 0]
        # three types of heads
        insize = cf.fsize
        self.bias_head = construct_head(insize, node_num)
        self.weight_head = nn.ModuleList([construct_head(insize, n) for n in header_size])
        if cf.learn_std:
            self.std_head = construct_head(insize, node_num)

        self.device = cf.device
        self.learn_std = cf.learn_std

    def forward(self, X):
        features = self.encoder(X)
        bias = self.bias_head(features)
        weights = torch.cat([H(features) for H in self.weight_head], dim = 1)
        if self.learn_std:
            tmp = self.std_head(features)
            std = torch.maximum(tmp, self.std_thresh)
        else:
            std = [None for i in range(X.shape[0])]
        return weights, bias, std

    def np_forward(self, arg):
        # make input 2d array
        if len(arg.shape) == 1:
            arg = arg.reshape(1,-1)

        # convert to float tensor
        X = torch.from_numpy(arg.astype(np.single)).to(self.device)
        with torch.no_grad():
            A,B,S = self.forward(X)
        A = A.cpu()
        B = B.cpu()
        if self.learn_std:
            S = S.cpu()
        return A,B,S

    def save_checkpoint(self):
        # save current model status in the current directory
        self.last_state = self.state_dict().copy()

    def load_checkpoint(self):
        # load the saved status
        self.load_state_dict(self.last_state)

    @staticmethod
    # this function can also be used to calculate log mass
    def loss_func(nn_out, sub_ydata, G, var = None, return_mass = False):
        # negative log mass
        A,b,s = nn_out
        if var is None:
            var = torch.square(s)

        selector = np.concatenate([G.V[i].parents for i in range(G.N)])
        aug_ydata = sub_ydata[:,selector]
        result = A * aug_ydata

        mean_vecs = []
        offset = 0
        for i in range(G.N):
            psize = len(G.V[i].parents)
            if psize > 0:
                mu = torch.sum(result[:, offset:(offset+psize)], dim = 1, keepdim = True) + b[:,i:(i+1)]
            else:
                mu = b[:,i:(i+1)]
            mean_vecs.append(mu)
            offset += psize

        mean = torch.cat(mean_vecs, dim = 1)
        log_mass = -0.5 * torch.square(sub_ydata - mean)/var - 0.5 * torch.log(2 * np.pi * var)

        if return_mass:
            ret = log_mass
        else:
            ret = -torch.sum(log_mass) / b.shape[0]
        return ret

# conditional GBN
class CondGBN:
    def __init__(self, cf):
        self.conf = cf

    def train(self, model, dataY, dataX, start = 0, stop = 0, verbose = False):
        # lrs is the learning rate scheduler
        N, _ = dataX.shape
        cf = self.conf
        G = self.gbn.g

        if stop == 0:
            stop = cf.max_epoch

        if start == 0:
            # train from beginning
            optimizer = optim.Adam(model.parameters(), betas=(0.9, 0.999), eps=1e-08, \
                            weight_decay = cf.weight_decay, amsgrad=False)
            model.optimizer = optimizer
            model.loss = partial(MyNet.loss_func, G = G)

            var = np.array( [self.gbn.potential[i].para[-1] for i in range(G.N)])
            var = var.reshape(1,-1).astype(np.single)

            if cf.learn_std:
                model.std_thresh = torch.sqrt(torch.Tensor([[cf.var_thresh]])).to(model.device)
                model.var = None
            else:
                var *= 0.25
                min_var = np.min(var)
                if min_var < cf.var_thresh:
                    warnings.warn('Too small variance, clip to variance thresh defined')
                    var = np.clip(var, cf.var_thresh, np.inf)
                var = torch.from_numpy(var).to(model.device)
                model.var = var
                model.std_thresh = None

        model.to(model.device)
        model.train()
        optimizer = model.optimizer

        # nn training
        if verbose and stop == cf.max_epoch:
            print('Training under params:')
            cf.show()

        batch_size = max(cf.batch_size, int(N/cf.batch_num)+1)
        final_epoches = cf.max_epoch - (cf.init_epoch + cf.last_epoch)
        scheduler = LrateScheduler(cf.max_LR, 0.01, cf.init_epoch, 0.005, final_epoches)
        best_score = -np.inf
        if verbose:
            pi = ProgressIndicator(stop - start)

        for epoch in range(start, stop):
            batch_loss = []
            st_time = time.time()
            lrate = scheduler.get_lrate(epoch)

            for g in optimizer.param_groups:
                g['lr'] = lrate

            for idxes in minibatch_index_generator(N, batch_size):
                sub_xdata = dataX[idxes,:]
                sub_ydata = dataY[idxes,:]
                optimizer.zero_grad()

                nn_out = model.forward(sub_xdata)
                loss = model.loss(nn_out, sub_ydata, var = model.var)
                batch_loss.append(loss.item())

                loss.backward()
                optimizer.step()

            ed_time = time.time()
            avg_loss = np.mean(batch_loss)
            loss_var = np.var(batch_loss)
            model_score = -avg_loss - loss_var

            # take the one that has the best score at last several epoches
            if (stop - epoch) <= (cf.last_epoch*2) and model_score > best_score:
                best_score = model_score
                model.save_checkpoint()

            if verbose:
                msg = 'E{:2d} time={:.2f}s lrate={:.8f} loss={:.2f} var={:.2f} score={:.2f} best={:.2f}'.format(
                    epoch+1, ed_time - st_time , lrate, avg_loss, loss_var, model_score, best_score)
                pi.at(epoch+1-start, info = msg)

        # load the best model and set to eval mode
        if best_score > -np.inf:
            model.load_checkpoint()
        model.eval()
        return best_score

    def fit(self, G, ydata, xdata, verbose = False):
        N, x_size = xdata.shape
        N_, y_size = ydata.shape
        assert(N == N_), "Invalid train data"
        assert(G.N == y_size), "Invalid graph"
        self.gbn = GBN(G).fit(ydata, var_thresh = self.conf.var_thresh)

        dataX = xdata.astype(np.single)
        dataY = ydata.astype(np.single)
        dataX = torch.from_numpy(dataX).to(self.conf.device)
        dataY = torch.from_numpy(dataY).to(self.conf.device)

        N_pre, epoch_pre = self.conf.pre_train
        num_parents = [len(G.V[i].parents) for i in range(G.N)]

        if verbose:
            print('Pretrain the models ...')

        candidates = list()
        for i in range(N_pre):
            model = MyNet(x_size, num_parents, self.conf)
            score = self.train(model, dataY, dataX, stop = epoch_pre, verbose = verbose)
            candidates.append( (score, model) )
        candidates.sort(reverse = True)
        best_model = candidates[0][1]

        self.train(best_model, dataY, dataX, start = epoch_pre, verbose = verbose)
        self.nn = best_model
        return self

    def moveto(self, device):
        # move all thing to target device
        self.conf.device = device
        self.nn.device = device
        self.nn.to(device)
        if self.conf.learn_std:
            self.nn.std_thresh = self.nn.std_thresh.to(device)
        else:
            self.nn.var = self.nn.var.to(device)
        return

    def __call__(self, arg, auto_forward = True):
        # arg can be a single instance x or nn_out
        if auto_forward:
            assert(len(arg.shape) == 1)
            A,b,s = self.nn.np_forward(arg)
            arg = (A[0], b[0], s[0])

        # change param of gbn based on nn output
        A,b,s = arg
        G = self.gbn.g

        offset = 0
        for i in range(G.N):
            psize = len(G.V[i].parents)
            if psize > 0:
                weight = A[offset:(offset+psize)]
                weight = weight.numpy()
            else:
                weight = None
            offset += psize

            bias = b[i].item()
            if s is None:
                var = self.nn.var[0, i].item()
            else:
                std = s[i].item()
                assert(std > 0)
                var = (std ** 2)

            self.gbn.potential[i].para = (weight, bias, var)

        mg = MultivariateGaussain.GBN2MG(self.gbn)
        return mg

# continous cutset network implementation
class ContCNet:
    def __init__(self, mode = 'MixMG', n_comps = -10, conf = nn_conf):
        assert(mode in ['MG', 'MixMG'])
        self.n_comps = n_comps
        self.mode = mode
        self.conf = conf
        self.sample_size = 200
        self.mass_correction = 1e-100

    def fit(self, data, cutset_var, cutset_only = False, verbose = True):
        # cutset variables are denoted as x while leaf vairbales are denoted as y
        N,D = data.shape
        self.xids = list(cutset_var)
        self.yids = utils.notin(range(D), cutset_var)

        xdata = data[:,self.xids]
        ydata = data[:,self.yids]

        if self.mode == 'MG':
            self.px = MultivariateGaussain().fit(xdata)
        if self.mode == 'MixMG':
            self.px = MixMG().fit(xdata, n_components = self.n_comps, verbose = verbose)

        if not cutset_only:
            yN, yD = ydata.shape
            G = Graph(digraph = False).make_complete_graph(yD)
            for i in range(yD):
                G.V[i].desc = 'x{}'.format(self.yids[i])

            # remove very low correlation edges
            corr_mat = tinylib.analyze_correlation(ydata)
            tmp = [(idx,corr_mat[idx]) for idx in utils.halfprod( range(yD) )]
            tmp.sort(key = lambda x:x[1])

            counter = 0
            for idx, v in tmp:
                if v < nn_conf.corr_thresh:
                    _s, _t = idx
                    G.E[_s].pop(_t, None)
                    G.E[_t].pop(_s, None)
                    counter += 1

            if verbose:
                print('{} edge(s) removed'.format(counter))
            else:
                self.removed_counter = counter

            G = G.todirect(0)
            self.py = CondGBN(self.conf).fit(G, ydata, xdata, verbose = verbose)

        return self

    def refit(self, data, verbose = True):
        # refit px part
        new_model = self.fit(data, self.xids, cutset_only=True, verbose=False)
        self.px = new_model.px

        # refit py part
        nn = self.py.nn
        xdata = data[:, self.xids].astype(np.single)
        ydata = data[:, self.yids].astype(np.single)
        dataX = torch.from_numpy(xdata).to(nn.device)
        dataY = torch.from_numpy(ydata).to(nn.device)

        # do extra 20% of max epoches for fine tuning
        start_epoch = self.py.conf.max_epoch
        self.py.conf.max_epoch += int(0.2 * self.py.conf.max_epoch)
        self.py.conf.last_epoch = int(0.2 * self.py.conf.max_epoch)
        self.py.train(nn, dataY, dataX, start = start_epoch, verbose = verbose)
        self.py.moveto('cpu') # for parallel prediction
        return self

    def mass(self, v):
        x = v[self.xids]
        y = v[self.yids]
        ret = self.px.mass(x) * self.py(x).mass(y) + self.mass_correction
        return ret

    def save_as_file(self, fpath):
        torch.save(self, fpath)
        return

    @staticmethod
    def load_from_file(fpath, device, delete = False):
        model = torch.load(fpath, map_location = device)
        model.py.moveto(device)
        if delete:
            os.remove(fpath)
        return model

    def score(self, data, return_mass = False, batch_size = 100):
        nn = self.py.nn
        arr = data.astype(np.single)
        arr = torch.from_numpy(arr).to(nn.device)
        sx = arr[:, self.xids]
        sy = arr[:, self.yids]
        N = sx.shape[0]

        if return_mass:
            ret = np.zeros(shape = (N,))
        else:
            ret = 0.0

        for idx in minibatch_index_generator(N, batch_size, with_last=True):
            x = sx[idx,:]
            y = sy[idx,:]
            nn_out = nn.forward(x)

            if return_mass:
                sub = nn.loss(nn_out, y, var = nn.var, return_mass = True)
                sub = sub.cpu().detach().numpy()
                ret[idx] = sub.sum(axis = 1)
            else:
                sub = -nn.loss(nn_out, y, var = nn.var)
                ret += sub.item() * x.shape[0]

        if not return_mass:
            ret = ret/N
        return ret

    def predict(self, X, query, N = -1, smooth = False, parallel = 1):
        '''
        query can be either fixed (a single list) or
        dynamic (list of query var for each instace x in X)
        '''
        if len(query) == X.shape[0] and hasattr(query[0], '__iter__'):
            pass
        else:
            query = [query] * (X.shape[0])

        if N <= 0:
            N = self.sample_size

        if parallel == 1:
            ret = [self._predict_(x, query[i], N, smooth) for i,x in enumerate(X)]
        else:
            assert(parallel > 0)
            ret = list( Xmap(self._predict_, list(zip(X,query)), chunksize=-1, N=parallel, \
                args=(N,smooth), star=True) )
        return np.array(ret)

    def _predict_(self, z, query, N = -1, smooth = False):
        if N <= 0:
            N = self.sample_size

        np.random.seed(N) # fix seed
        nan_idx = np.where(np.isnan(z))[0]
        missing = utils.notin(nan_idx, query)

        x = z[self.xids]
        y = z[self.yids]
        assert( len(query) > 0)

        unknown = np.concatenate([query, missing])
        ux = []; uy = [] # unknown x,y list
        for u in unknown:
            if u in self.xids:
                ux.append( self.xids.index(u) )
            else:
                uy.append( self.yids.index(u) )

        # increase sample number if large query and missing
        ux_ratio = len(ux) / max(len(self.xids), 5)
        N = int(N * (1 + ux_ratio*4))
        extra_sample_rate = (1.2 + 0.8*ux_ratio)

        if len(ux) > 0 :
            Nx = len(self.xids)
            kx = utils.notin(range(Nx), ux) # known x
            sx = self.px.rvs( int(N * extra_sample_rate), evi = (kx, x[kx]))
            mass = self.px.mass(sx)
            mass_rank = np.argsort(mass)
            selector = mass_rank[-N:]
            sx = sx[selector, :]
        else:
            sx = np.array([x]).reshape(1,-1)

        size = sx.shape[0]
        A,B,S = self.py.nn.np_forward(sx)
        distY = [self.py((A[i],B[i],S[i]), False) for i in range(size)]

        if len(uy) > 0:
            sy = [m._predict_(y, uy) for m in distY]
        else:
            sy = [y for _ in range(size)]
        sy = np.array(sy)

        # select one sample that has highest mass
        mass = []
        y_qe = [i for i,v in enumerate(self.yids) if v not in missing]
        for i in range(size):
            x = sx[i]
            y = sy[i]
            mass.append( self.px.mass(x) * distY[i].marginalize(y_qe).mass(y[y_qe]) )
        mass = np.array(mass)

        mass_rank = np.argsort(mass)
        best_idx = mass_rank[-1]
        candidates = []

        if smooth:
            # pick all samples that has mass close to the best one (95%, at most 5)
            best_mass = mass[best_idx]
            for idx in mass_rank[-5:]:
                if mass[idx] >= (best_mass) * 0.95:
                    candidates.append(idx)
        else:
            candidates.append(best_idx)

        ret = z.copy()
        ret[self.xids] = np.mean(sx[candidates], axis = 0)
        ret[self.yids] = np.mean(sy[candidates], axis = 0)
        return ret

if __name__ == '__main__':
    MultivariateGaussain.selftest()


