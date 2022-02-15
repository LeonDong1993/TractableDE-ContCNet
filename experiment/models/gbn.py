import numpy as np
from pdb import set_trace

from tinylib import logmass_statistic
from contcnet import MultivariateGaussain
from utmLib.clses import Timer
from utmLib.ml.GBN import GBN

def predict_wrapper(model, test):
    pred = []
    for item in test:
        unknown = np.where( np.isnan(item) )[0]
        pred.append( model._predict_(item, unknown) )
    return np.array(pred)

def run_exp(dataset, options):
    print('Running GBN ....')
    np.random.seed(options.seed)
    _train, _valid, test_set = dataset
    # no need valid, stack valid data into train data
    train = np.vstack([_train, _valid])
    myclock = Timer()

    g = GBN.chowliu_tree(train)
    m = GBN(g).fit(train, var_thresh = 4e-3)
    myclock.ring('CLGBN fit')

    train_logmass = [np.log(m.mass(x)) for x in train]
    test_logmass  = [np.log(m.mass(x)) for x in options.gt]
    print('CLGBN train logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format( *logmass_statistic(train_logmass) ))
    print('CLGBN test  logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format( *logmass_statistic(test_logmass) ))
    myclock.ring('CLGBN logmass computation')


    mg = MultivariateGaussain().fit(train)
    myclock.ring('MG fit')

    train_logmass = mg.mass(train, logmode = True)
    test_logmass  = mg.mass(options.gt, logmode = True)
    print('MG train logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format( *logmass_statistic(train_logmass) ))
    print('MG test  logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format( *logmass_statistic(test_logmass) ))
    myclock.ring('MG logmass computation')

    # save the trained model (skipped)

    result = []
    for i, _ in enumerate(options.query_var):
        # this two methods predict both query, missing variables
        test = test_set[i].copy()
        model_result = []

        pred = predict_wrapper(m, test)
        model_result.append( ('CLGBN', pred ))
        pred_mass = [np.log(m.mass(x)) for x in pred]
        if isinstance(options.missing[i], float) and options.missing[i] == 0:
            print('S{}, CLGBN pred logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format(i, *logmass_statistic(pred_mass) ))
        myclock.ring('CLGBN predict')

        pred = predict_wrapper(mg, test)
        model_result.append( ('MG', pred ) )
        pred_mass = mg.mass(pred, logmode = True)
        if isinstance(options.missing[i], float) and options.missing[i] == 0:
            print('S{}, MG pred logmass: p25 {:.6f} median {:.6f} p75 {:.6f} avg {:.6f}'.format(i, *logmass_statistic(pred_mass) ))
        myclock.ring('MG predict')

        result.append(model_result)

    return result

