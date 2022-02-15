# objects defined in this script will all be imported by tinylib
import numpy as np
from chd import CHD
from sklearn.decomposition import PCA
from autoencoder import DAET

# a transform wrapper
class imglr:
    def __init__(self, imgdim, trans_class, **kwargs):
        self.T = trans_class
        self.kwargs = kwargs
        self.imgdim = imgdim

    def fit(self, data):
        r,c = self.imgdim
        mid = int(c/2)
        assert( r*c == data.shape[1])

        left = [i*r + j for i in range(r) for j in range(0, mid)]
        right = [i*r + j for i in range(r) for j in range(mid, c)]
        data_left = data[:, left]
        data_right = data[:, right]
        lT = self.T(**self.kwargs).fit(data_left)
        rT = self.T(**self.kwargs).fit(data_right)

        self.obj = (lT, rT)
        self.inds = (left, right)
        self.size = data.shape[1]
        return self

    def transform(self, X):
        lT, rT  = self.obj
        l,r = self.inds
        Y = np.concatenate( [lT.transform(X[:,l]), rT.transform(X[:,r])], axis=1)
        return Y

    def inverse_transform(self, Y):
        lT, rT  = self.obj
        l,r= self.inds
        k = int(Y.shape[1] / 2)
        X = np.zeros(shape=(Y.shape[0], self.size))
        X[:,l] = lT.inverse_transform(Y[:, 0:k])
        X[:,r] = rT.inverse_transform(Y[:, k:])
        return X

    def __repr__(self):
        obj = self.T(**self.kwargs)
        desc = 'ImgLR({}-{}x{})'.format(obj, *self.imgdim)
        return desc



class imgud:
    def __init__(self, imgdim, trans_class, **kwargs):
        self.T = trans_class
        self.kwargs = kwargs
        self.imgdim = imgdim

    def fit(self, data):
        r,c = self.imgdim
        mid = int(r/2) #
        assert( r*c == data.shape[1])

        left = [i*r + j for i in range(0,mid) for j in range(c)]  #
        right = [i*r + j for i in range(mid,r) for j in range(c)] #

        data_left = data[:, left]
        data_right = data[:, right]
        lT = self.T(**self.kwargs).fit(data_left)
        rT = self.T(**self.kwargs).fit(data_right)

        self.obj = (lT, rT)
        self.inds = (left, right)
        self.size = data.shape[1]
        return self

    def transform(self, X):
        lT, rT  = self.obj
        l,r = self.inds
        Y = np.concatenate( [lT.transform(X[:,l]), rT.transform(X[:,r])], axis=1)
        return Y

    def inverse_transform(self, Y):
        lT, rT  = self.obj
        l,r= self.inds
        k = int(Y.shape[1] / 2)
        X = np.zeros(shape=(Y.shape[0], self.size))
        X[:,l] = lT.inverse_transform(Y[:, 0:k])
        X[:,r] = rT.inverse_transform(Y[:, k:])
        return X

    def __repr__(self):
        obj = self.T(**self.kwargs)
        desc = 'ImgUD({}-{}x{})'.format(obj, *self.imgdim) #
        return desc