import numpy as np
from pdb import set_trace
import matplotlib.pyplot as plt

# load all the prediction data
models = [('MG','MG'),('RNADE','RNADE'),('spn','spnflow'),('ours','Ours')]
cases = [('right', 'mnist-lr', 0), ('left', 'mnist-lr', 1), ('bot', 'mnist-ud', 0),('top', 'mnist-ud', 1)]
data = {}

for c,d,s in cases:
    for a,b in models:
        data[c,a] = np.loadtxt(f'{d}/{a}/{b}_s{s}.rec_pred',delimiter=',')
data['gt'] = np.loadtxt('mnist-lr/MG/mnist.ori_gt', delimiter=',')

# find samples that are predict most differenly by models
diff_rank = {}
for c,_,_ in cases:
    sub = np.array([ data[c,a] for a,_ in models])
    sample_diff = [np.sum(np.var(sub[:,i,:], axis = 0)) for i in range(sub.shape[1])]
    diff_rank[c] = np.argsort(sample_diff)

combind_rank = [0 for _ in range(data[c,a].shape[0])]
for item in diff_rank.values():
    for i,v in enumerate(item):
        combind_rank[v] += i

full_diff_rank = np.argsort(combind_rank)
X = list(full_diff_rank)
X = list(reversed(X))

def supp_plot():
    N = 50
    idx = X[0:N]
    nrow = int(N/2)
    ncol = 4*2


    def vis(data, nrows, ncols, name, mr=None, mc=None):
        counter = 0
        for row in data:
            pixels = row.reshape(28,28)*255
            pixels = np.clip(pixels,0,255)
            pixels = pixels.astype(np.uint8)
            i = counter % nrows
            j = counter // nrows
            idx = i*ncols + j + 1
            # print(i,j,idx)
            plt.subplot(nrows, ncols, idx)
            plt.imshow(pixels, cmap='gray')

            if mr is not None:
                ar = np.zeros( (28,28) )
                ar[:,:] = np.nan
                ar[np.ix_(mr, mc)] = 1
                plt.imshow(ar, alpha=0.6, cmap="RdBu")

            plt.axis('off')

            counter += 1
        plt.subplots_adjust(wspace=0, hspace=0, left=0.2, right=0.5)
        plt.savefig(name + '.pdf', dpi = 250)

    # print ground truth
    vis(data['gt'][idx,:], nrow, ncol, 'gt')

    mask_mapping= {
        'right':(range(28), range(14,28)),
        'left':(range(28), range(0,14)),
        'bot':(range(14,28), range(28)),
        'top':(range(0,14), range(28))
    }


    for c,_,_ in cases:
        sub = None
        for a,_ in models:
            if sub is None:
                sub = data[c,a][idx,:]
            else:
                sub = np.vstack( (sub, data[c,a][idx,:] ) )
        vis(sub, nrow, ncol, c, *mask_mapping[c])




def paper_plot():
    N = 10
    # idx = full_diff_rank[-N:]
    # top resutls is [173, 91, 128, 0, 74, 130, 31, 146, 11, 8, 178, 159, 98, 135, 53, 126, 40, 112, 59 ...]
    # remove some digits that are hard for human as well from top
    idx = [173, 91 , 0, 130 ,31 ,146 ,11, 8, 112, 59]
    print(idx)


    def vis(data, nrows, ncols, name, mr=None, mc=None):
        counter = 0
        for row in data:
            pixels = row.reshape(28,28)*255
            pixels = np.clip(pixels,0,255)
            pixels = pixels.astype(np.uint8)
            i = counter % nrows
            j = counter // nrows
            idx = i*ncols + j + 1
            # print(i,j,idx)
            plt.subplot(nrows, ncols, idx)
            plt.imshow(pixels, cmap='gray')

            if mr is not None:
                ar = np.zeros( (28,28) )
                ar[:,:] = np.nan
                ar[np.ix_(mr, mc)] = 1
                plt.imshow(ar, alpha=0.4, cmap="RdBu")

            plt.axis('off')

            counter += 1
        plt.subplots_adjust(wspace=0, hspace=0, left=0.2, right=0.45)
        plt.savefig(name + '.jpg', dpi = 250)

    # print ground truth
    vis(data['gt'][idx,:], N, 1, 'gt')

    mask_mapping= {
        'right':(range(28), range(14,28)),
        'left':(range(28), range(0,14)),
        'bot':(range(14,28), range(28)),
        'top':(range(0,14), range(28))
    }


    for c,_,_ in cases:
        sub = None
        for a,_ in models:
            if sub is None:
                sub = data[c,a][idx,:]
            else:
                sub = np.vstack( (sub, data[c,a][idx,:] ) )
        vis(sub, N, 4, c, *mask_mapping[c])


paper_plot()
supp_plot()




