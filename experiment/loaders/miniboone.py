import numpy as np
import h5py
from pdb import set_trace

def load_continuous_dataset(filepath):
    with h5py.File(filepath, 'r') as fh:
        data_train = fh['train'][:]
        data_valid = fh['valid'][:]
        data_test = fh['test'][:]
        return data_train, data_valid, data_test

def load_data(options):
    print('Loading miniboone data .....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    t, v, te = load_continuous_dataset(data_file)
    data = np.vstack([t,v,te])
    return data

