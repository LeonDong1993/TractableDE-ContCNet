import numpy as np
from skimage.measure import block_reduce
from pdb import set_trace

VERSION = '08-26-21 21:56'
ENDIAN = 'big'
MAX_VAL = 255.0

def load_data(options):
    print('Loading mnist data .....')
    data_dir = '{}/{}'.format(options.root_dir, options.data_path)
    if options.label:
        train, ltt, test, lte = read_mnist(data_dir, options.down_sample, label=True)
    else:
        train, test = read_mnist(data_dir, options.down_sample, label=False)

    # add gaussian noise to train data for more numerical stable learning
    if options.noise:
        N,D = train.shape
        noise = np.random.normal(0, 0.005, size = (N,D))
        noise = np.clip(noise, -0.05, 0.05)
        train += noise

    # add labels to last column if needed
    if options.label:
        ltt = ltt.reshape(-1,1)
        train = np.concatenate([train, ltt], axis = 1)
        lte = lte.reshape(-1,1)
        test = np.concatenate([test,lte], axis = 1)

    return train, test

def read_images(fname, down_sample):
    f = open(fname,'rb')
    assert( int.from_bytes(f.read(4),ENDIAN) == 2051 )
    N = int.from_bytes(f.read(4),ENDIAN)
    row_size = int.from_bytes(f.read(4),ENDIAN)
    col_size = int.from_bytes(f.read(4),ENDIAN)
    buf = f.read(N*row_size*col_size)
    data = np.frombuffer(buf, dtype=np.uint8).astype(np.float32).reshape(N, row_size * col_size)
    f.close()

    # flatten the image and downsample a little bit, normalize to 0-1
    ret = []
    for row in data:
        img = row.reshape(row_size,col_size)

        if down_sample:
            img = block_reduce(img, (2,2), np.max)

        ret.append(img.flatten()/MAX_VAL)
    return np.array(ret)

def read_label(fname):
    f = open(fname,'rb')
    assert( int.from_bytes(f.read(4),ENDIAN) == 2049 )
    N = int.from_bytes(f.read(4),ENDIAN)
    buf = f.read(N)
    data = np.frombuffer(buf, dtype=np.uint8).astype(np.float32)
    f.close()
    return data

def read_mnist(data_dir, down_sample = True, label = False):
    train_image = f'{data_dir}/train-images.idx3-ubyte'
    train_label = f'{data_dir}/train-labels.idx1-ubyte'
    test_image = f'{data_dir}/t10k-images.idx3-ubyte'
    test_label = f'{data_dir}/t10k-labels.idx1-ubyte'
    Xtr = read_images(train_image, down_sample)
    ytr = read_label(train_label)
    Xte = read_images(test_image, down_sample)
    yte = read_label(test_label)

    if label:
        return Xtr,ytr,Xte,yte
    else:
        return Xtr,Xte

