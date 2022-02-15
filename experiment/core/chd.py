import warnings
import numpy as np
from pdb import set_trace

from utmLib.clses import ProgressIndicator
from utmLib.parmapper import Xmap

#  can use parallel to speed up fit, calculate distance simutaneously

class CHD:
    # convex hall decomposition
    def __init__(self, n_components, cpus = 1, dist_func = None) :
        self.k = n_components
        self.cpus = cpus
        if dist_func is None:
            self.dist = CHD._default_dist_func_
        else:
            self.dist = dist_func

    @staticmethod
    def _default_dist_func_(p, q):
        # the default dist function
        return np.linalg.norm(p-q)

    def _dist_p2h_(self, q, S, eps = 1e-2, maxiter = 100):
        # calculate the distance of a point q to the convex hull formed by set of points in S
        # it also approximatelly represent q as weighted combination of the points in S

        # find the closet point in S to q
        ind = np.argmin([self.dist(p,q) for p in S])
        t = S[ind,:]

        # record the convex combination weight
        weight = np.zeros(S.shape[0])
        weight[ind] = 1.0
        last_diff = 0.0

        for i in range(maxiter):
            # find most extreme point in S in the direction of q-t
            vec = q-t
            tmp = [np.inner(vec,p-t) for p in S]
            ind = np.argmax(tmp)

            # break if no such point
            if tmp[ind] <= 0:
                break

            p = S[ind,:]
            vec = p - t
            # project q-t into vec
            Z = np.dot(vec,vec)
            ratio = vec.dot(q-t)/Z
            newt = t + ratio * vec
            weight *= 1-ratio
            weight[ind] += ratio

            # break if coverge
            last_diff = self.dist(newt,t)
            t = newt
            if last_diff < eps:
                break

        return self.dist(q,t), weight

    def _find_cvx_hull_(self, X, k, verbose = True):
        N,F = X.shape
        if N <= F: warnings.warn('Numer of samples less than number of feature!')

        # parameter for reducing search space and hence increase speed
        ratio = 0.05
        pct = 5.0
        multiple = 4.0
        # assume the maximum distance of all candidate points to the convex hull is MaxDis
        # ratio - if distance of a point to convex hull is less than [ratio*MaxDis], it will not be considered as candidates
        # pct - if distance of a point to convex hull is the last [pct] percent of all points, it will not be considered as candidates
        # multiple - maintain at least [j * multiple] number of candidates if we still need [j] points in the convex hull

        # initially candidates is all points and we select the first element into convex hull
        idxes = [0]
        candidates = np.arange(X.shape[0])
        init_dist = None
        last_dist = None

        if verbose:
            pi = ProgressIndicator(k, msg = 'Find convex hull')

        for i in range(k):
            # choose the one farest from current cvx hull
            B = X[idxes,:]
            D = np.array([self._dist_p2h_(item, B)[0] for item in X[candidates,:]])
            ind = np.argmax(D)
            idxes.append(candidates[ind])

            # reduce search space
            maxdis = D[ind]
            thresh = max( ratio*maxdis, np.percentile(D,pct) )
            selector = D > thresh
            if np.sum(selector) > multiple*(k-i):
                candidates = candidates[selector]

            if i == 0:
                init_dist = maxdis
            else:
                last_dist = maxdis

            if verbose:
                pi.at(i)

            # remove the first one
            if i == 0:
                idxes.pop(0)

        if verbose:
            print( 'Distance reduction ratio (0-1): {:.5f}'.format(1 - last_dist / init_dist) )

        return idxes

    def fit(self, X, verbose = True):
        inds = self._find_cvx_hull_(X, self.k, verbose=verbose)
        self.S = X[inds, :]
        return self

    def transform(self, X):
        parallel = self.cpus
        if parallel == 1:
            Y = [self._dist_p2h_(p,self.S)[1] for p in X]
        else:
            assert( parallel > 0 )
            Y = list( Xmap(self._dist_p2h_, X, args=(self.S,), progress=False, N=parallel, chunksize=-1) )
            Y = [w for _,w in Y]
        return np.array(Y)

    def inverse_transform(self, Y):
        return Y.dot(self.S)

    def __repr__(self) -> str:
        desc = 'CHD-{}'.format(self.k)
        return desc

def module_test():
    import random
    import matplotlib.pyplot as plt
    # generate fake dataset in a unit circle
    N = 1000
    points = []
    for _ in range(N):
        r = np.sqrt(np.sqrt(random.random()))
        x = (random.random()*2 - 1) * r
        y = np.sqrt(r**2 - x**2)
        if random.random() < 0.5:
            y = -y
        points.append( (x,y) )
    points = np.array(points)

    chd = CHD(20).fit(points)
    Y = chd.transform(points)
    X = chd.inverse_transform(Y)
    B = chd.S

    plt.figure()
    plt.scatter(points[:,0],points[:,1])
    plt.scatter(B[:,0],B[:,1],marker = '*',c = 'r')
    plt.savefig('chd_test.jpg')

    diff = np.sum(np.abs(X - points))
    print('Transform loss is {:.5f}'.format(diff/np.sum(np.abs(points))))


if __name__ == "__main__":
    module_test()
