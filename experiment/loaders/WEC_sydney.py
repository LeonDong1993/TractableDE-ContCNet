import numpy as np
from utmLib import utils
from pdb import set_trace

def load_data(options):
    print('Loading WEC-Sydney data .....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    # read_data
    data = np.loadtxt(data_file, delimiter= ',', dtype = 'float')

    high_corr_elim = []
    selector = utils.notin(range(data.shape[1]), high_corr_elim)
    data = data[:,selector]

    return data