import numpy as np
from utmLib import utils
from pdb import set_trace

def load_data(options):
    print('Loading crop mapping data .....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    # read_data
    data = np.loadtxt(data_file, delimiter= ',', dtype = 'float')

    useless_attr = [172, 126, 134, 164, 170, 171, 133, 163, 125, 132, 162, 167, 169, 98, 124, 166, 168, 128, 129, 131, 100, 99, 101, 161,130, 158, 159, 120]
    selector = utils.notin(range(data.shape[1]), useless_attr)
    data = data[:,selector]

    high_corr_elim = [1, 3, 131, 132, 6, 5, 137, 141, 142, 15, 16, 17, 34, 36, 39, 43, 44, 53, 54, 55, 61, 75, 86, 87, 92, 94, 100, 102, 103]
    selector = utils.notin(range(data.shape[1]), high_corr_elim)
    data = data[:,selector]

    return data