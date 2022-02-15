import numpy as np
from pdb import set_trace

from pyLeon import utils
from pyLeon.misc import Timer
from pyLeon.parmapper import Xmap

class knn:
    def fit(self, data, with_label = True):
        if with_label:
            self.data = data[:, 0:-1]
            self.labels = data[:,-1].astype(np.int32)
            self.types = np.unique(self.labels).size
        else:
            self.data = data
            self.labels = None
        return self

    def predict(self, test, N=5, parallel = 1):
        # no difference for map and mmap, so query var list is not needed
        if self.labels is not None:
            labels = test[:, -1].astype(np.int32)
            test = test[:, 0:-1]

        if parallel == 1:
            ret = [self._predict_(x, N) for x in test]
        else:
            ret = list( Xmap(self._predict_, test, args=(N,), N=parallel, chunksize=-1) )


        if self.labels is not None:
            pred, tags = list(zip(*ret))
            print('knn classification rate is {}'.format(np.sum(tags == labels)/ labels.size))
        else:
            pred = ret

        return np.array(pred)

    def _predict_(self, x, N=5):
        nan_idx = np.where(np.isnan(x))[0]
        evi_idx = utils.notin( range(x.size) ,nan_idx )
        rank, distances = knn.find_nearest(self.data[:,evi_idx], x[evi_idx])

        y = x.copy()
        selector = rank[0:N].astype(np.int32)
        weight = distances[selector]
        weight = weight/np.sum(weight)
        weight = weight.reshape(-1,1)
        y[nan_idx] = np.sum(weight * self.data[np.ix_(selector, nan_idx)], axis=0)
        ret = y

        if self.labels is not None:
            class_weight = np.zeros((self.types, ), dtype = np.float32)
            for i,ii in enumerate(selector):
                class_weight[ self.labels[ii] ] += weight[i]
            ret = (y, np.argmax(class_weight))

        return ret

    @staticmethod
    def find_nearest(data, p, dist_func = None):
        # find points inside the data that are most close to p
        def default_dist(x,y):
            return np.linalg.norm(x-y)
        if dist_func is None:
            dist_func = default_dist

        distances = np.array([dist_func(x,p) for x in data])
        rank = np.argsort(distances)
        return rank, distances


def run_exp(dataset, options):
    myname = 'knn-regressor'
    np.random.seed(options.seed)
    print(f'Run {myname} ....')

    train, valid, test_set = dataset
    full_train = np.vstack([train, valid])
    myclock = Timer()

    m = knn().fit(full_train, with_label=True)

    result = []
    for i, _ in enumerate(options.query_var):
        model_result = []
        test = test_set[i].copy()

        model_result.append( (myname, m.predict(test, parallel=options.cpu_process)) )
        myclock.ring(f'{myname} predict')

        result.append(model_result)

    return result

