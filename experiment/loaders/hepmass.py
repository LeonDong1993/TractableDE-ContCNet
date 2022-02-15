import numpy as np
import h5py
from utmLib import utils

def load_continuous_dataset(filepath):
    with h5py.File(filepath, 'r') as fh:
        data_train = fh['train'][:]
        data_valid = fh['valid'][:]
        data_test = fh['test'][:]
        return data_train, data_valid, data_test

def load_data(options):
    print('Loading hepmass data .....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    t, v, te = load_continuous_dataset(data_file)
    all_data = np.vstack([t,v,te])
    selector = np.linspace(0,all_data.shape[0]-1, 150000)
    selector = selector.astype(int)
    data = all_data[selector,:]

    high_corr_elim = []
    selector = utils.notin(range(data.shape[1]), high_corr_elim)
    data = data[:,selector]

    return data

