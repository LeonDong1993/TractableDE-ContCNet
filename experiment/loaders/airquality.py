import numpy as np
from utmLib import utils
from pdb import set_trace

def load_data(options):
    print('Loading air quality data .....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    # read_data
    raw = utils.read_text(data_file, header=True, splitter = ',')
    raw = np.array(raw)
    data = raw[:, 0:-2] # remove  last 2 empty feature

    useless_attr = [0,1]
    selector = utils.notin(range(data.shape[1]), useless_attr)
    data = data[:,selector].astype(float)

    high_corr_elim = [12]
    selector = utils.notin(range(data.shape[1]), high_corr_elim)
    data = data[:,selector]

    return data