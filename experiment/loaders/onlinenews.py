import numpy as np
from pdb import set_trace
from utmLib import utils

def load_data(options):
    print('Loading the onlinenews data.....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    # read_data
    raw =  np.loadtxt(data_file ,delimiter=',', encoding='utf-8', dtype=str)
    data = raw[1:]

    useless_attr = [0,1] + list(range(13,19)) + list(range(31,39))
    selector = utils.notin(range(data.shape[1]), useless_attr)
    data = data[:,selector].astype(float)

    useless_attr = [10, 0, 11, 35, 15, 36, 39, 8, 38, 6, 7]
    selector = utils.notin(range(data.shape[1]), useless_attr)
    data = data[:,selector].astype(float)

    high_corr_elim = [1,2]
    selector = utils.notin(range(data.shape[1]), high_corr_elim)
    data = data[:,selector]

    return data