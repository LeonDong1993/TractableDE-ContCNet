import numpy as np
from sklearn.impute import KNNImputer
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestRegressor
from sklearn.svm import SVR
from copy import deepcopy
from pdb import set_trace

from pyLeon import utils
from pyLeon.misc import Timer

class Wrapper:
    def __init__(self,model):
        self.m = model
        self.fitted = {}

    def fit(self,train):
        self.data = train
        return self

    def predict(self,test,unknown):
        ret = test.copy()
        given = utils.notin(range(test.shape[1]), unknown)
        test_x = test[:,given]

        if len(self.fitted) == 0:
            train_x = self.data[:,given]
            for u in unknown:
                train_y = self.data[:,u]
                clr = deepcopy(self.m)
                clr.fit(train_x, train_y)
                self.fitted[u] = clr
            del self.data

        for u in unknown:
            pred = self.fitted[u].predict(test_x)
            ret[:,u]  = pred
        return ret

def run_exp(dataset, options):
    print('Running sklearn regressors ...')
    _train, _valid, test_set = dataset
    # no need valid, stack valid data into train data
    train = np.vstack([_train, _valid])
    myclock = Timer()

    result = []
    prev_qv = None

    for i, query in enumerate(options.query_var):
        tmp = np.unique(query)
        assert(  not hasattr(tmp[0], '__len__') ), "Only fix query supported"
        cur_qv = tuple(tmp)

        test = test_set[i].copy()
        imputed = KNNImputer().fit_transform( np.vstack([train, test]) )
        test = imputed[train.shape[0]:, :]
        myclock.ring('Imputation')

        if prev_qv is None or (cur_qv != prev_qv):
            prev_qv = cur_qv
            lr = Wrapper(LinearRegression()).fit(train)
            svr = Wrapper(SVR()).fit(train)
            rfr10 = Wrapper(RandomForestRegressor(n_estimators = 10)).fit(train)
            rfr100 = Wrapper(RandomForestRegressor(n_estimators = 100)).fit(train)

        model_result = []
        model_result.append( ('Impute', test) )

        # model_result.append( ('LR', lr.predict(test,cur_qv)) )
        # myclock.ring('LR')

        model_result.append( ('SVR', svr.predict(test,cur_qv))  )
        myclock.ring('SVR')

        model_result.append( ('RFR10', rfr10.predict(test,cur_qv)) )
        myclock.ring('RFR10')

        model_result.append( ('RFR100', rfr100.predict(test,cur_qv)) )
        myclock.ring('RFR100')

        result.append(model_result)

    return result
