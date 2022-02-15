import numpy as np
from utmLib import utils
from pdb import set_trace

VERSION = '08-26-21 21:57'

def load_data(options):
    print('Loading parkinson data .....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    # read_data
    raw = utils.read_text(data_file, header=False, splitter = ',')
    raw = np.array(raw)
    data = raw[1:]

    useless_attr = [0,1,2]
    selector = utils.notin(range(data.shape[1]), useless_attr)
    data = data[:,selector].astype(float)

    high_corr_elim = [8, 3, 13, 7]
    selector = utils.notin(range(data.shape[1]), high_corr_elim)
    data = data[:,selector]

    return data
