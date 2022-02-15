import numpy as np
from pdb import set_trace

from utmLib.clses import Timer
from utmLib import sci, utils
from models import spnet
from lenet5 import NNClassifier
from tinylib import logmass_statistic

class CondSPN:
    def fit(self, train, valid, options):
        xtr, ytr = train
        xva, yva = valid
        mva, qva = options.valid_extra
        classes, counts = np.unique( np.concatenate([ytr, yva]), return_counts=True)

        leaves = []
        for c in classes:
            sub_train = xtr[ytr == c ,:]
            selector = yva == c
            sub_valid = xva[selector ,:]
            sub_mva = mva[selector, :]
            sub_qva = [qva[i] for i,v in enumerate(selector) if v]
            leaves.append( spnet.tune_and_fit(sub_train, sub_valid, (sub_mva,sub_qva), options, verbose=False) )

        self.classes = classes
        self.label_dist = counts/np.sum(counts)
        self.leaf_models = leaves
        return self

    def predict(self, test, query, N = 0, parallel = 1):
        preds = []
        densities =[]
        for i,m in enumerate(self.leaf_models):
            p = m.predict(test, query, N_sample=N, parallel=parallel)
            d = m.mass(p) * self.label_dist[i]
            preds.append(p)
            densities.append(d)
        densities = np.array(densities)
        idx = np.argmax(densities, axis = 0)

        tag = self.classes[idx] # predicted label
        pred = np.array([ preds[j][i]  for i,j in enumerate(idx) ]) # prediction results
        return pred, tag

    def predict_with_label(self, test, label, query, N = 0, parallel = 1):
        ret = test.copy()
        for c,m in zip(self.classes, self.leaf_models):
            selector = label == c
            subX = test[selector,:]
            subQ = [query[i] for i,v in enumerate(selector) if v]
            ret[selector, :] = m.predict(subX, subQ, N_sample = N, parallel = parallel)
        return ret

    def mass(self, data, label):
        ret = np.zeros(shape = (data.shape[0],) )
        for i,(c,m) in enumerate( zip(self.classes, self.leaf_models) ):
            selector = label == c
            sub = data[selector, :]
            ret[selector] = m.mass(sub) * self.label_dist[i]
        return ret

def run_exp(dataset, options):
    myname = 'condspn'
    np.random.seed(options.seed)
    print(f'Run {myname} ....')

    train, valid, test_set = dataset
    ltr, lva, lte = options.data_label
    full_train = np.vstack([ train, valid ])
    full_label = np.concatenate([ ltr, lva ])
    myclock = Timer()
    model_file = '{}/spn-cond.model'.format(options.dir)

    try:
        model = utils.pkload(model_file)
        print('Loaded from pre-trained cond-spn model.')
    except:
        model = CondSPN().fit((train, ltr), (valid, lva), options)
        if options.dir != '':
            utils.pkdump(model, model_file)
    myclock.ring(f'{myname} fitting')

    result = []
    for i,query in enumerate(options.query_var):
        model_result = []
        test = test_set[i].copy()

        pred, tag = model.predict(test, query, parallel = options.cpus)
        model_result.append( (myname, pred ) )
        pred_logmass = model.mass(pred, tag)
        print('S{}, pred logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format(i, *logmass_statistic(pred_logmass) ))
        myclock.ring(f'{myname} prediction')
        print('Model prediction accuracy is {}'.format(np.sum(tag == lte) / lte.size))

        assert( len(np.unique(query).shape) == 1 )
        evidence = utils.notin( range(train.shape[1]), query[0])
        nn_train = full_train[:, evidence]
        file_name = '{}/{}_{}.nnclf'.format(options.cache_dir ,options.name, sci.hash_array(nn_train) )
        try:
            nn_clf = utils.pkload(file_name)
            print('Load trained NN classifier from cache.')
        except:
            nn_clf = NNClassifier().fit(nn_train, full_label, device = 'cpu', maxlr = 0.005)
            utils.pkdump(nn_clf, file_name)
        nn_label = nn_clf.predict(test[:, evidence])
        print('NN prediction accuracy is {}'.format(np.sum(nn_label == lte) / lte.size))

        pred = model.predict_with_label(test, nn_label, query, parallel=options.cpus)
        model_result.append( (f'{myname}-label', pred) )
        pred_logmass = model.mass(pred, nn_label)
        print('S{}, nnlabel pred logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format(i, *logmass_statistic(pred_logmass) ))
        myclock.ring(f'{myname}-label predict')

        result.append(model_result)

    return result

