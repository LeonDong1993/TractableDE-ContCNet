import numpy as np
from pdb import set_trace
from utmLib import utils

def load_data(options):
    print('Loading the energy data.....')
    data_file = '{}/{}'.format(options.root_dir, options.data_path)
    # read_data
    raw = utils.read_text(data_file, header=False, splitter = ',')
    for i, item in enumerate(raw):
        raw[i] = list(map(lambda s:s.replace('"','') ,item))
    raw = np.array(raw, dtype=str)
    data = raw[1:]

    useless_attr = [0,1,2,27,28]
    selector = utils.notin(range(data.shape[1]), useless_attr)
    data = data[:,selector].astype(float)

    return data