import numpy as np
from pdb import set_trace
from utmLib import utils

def load_data(options):
    print('Loading the superconduct data.....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    # read_data
    raw =  np.loadtxt(data_file ,delimiter=',', encoding='utf-8', dtype=str)
    data = raw[1:]

    useless_attr = [77, 0, 71, 79, 27, 73]
    selector = utils.notin(range(data.shape[1]), useless_attr)
    data = data[:,selector].astype(float)

    high_corr_elim = [65, 70, 13, 14, 18, 21, 55, 24]
    selector = utils.notin(range(data.shape[1]), high_corr_elim)
    data = data[:,selector]

    return data