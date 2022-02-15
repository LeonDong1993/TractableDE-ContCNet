import numpy as np
from utmLib import utils
from pdb import set_trace

def load_data(options):
    print('Loading Sensorless_drive_diagnosis data .....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    # read_data
    data = np.loadtxt(data_file, delimiter= ' ', dtype = 'float')

    useless_attr = [48, 45, 46, 47, 44, 42, 43]
    selector = utils.notin(range(data.shape[1]), useless_attr)
    data = data[:,selector].astype(float)

    high_corr_elim = [32, 33, 35, 6, 7, 9, 10, 18, 19, 20, 21, 22, 30]
    selector = utils.notin(range(data.shape[1]), high_corr_elim)
    data = data[:,selector]

    return data