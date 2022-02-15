import numpy as np
import matplotlib.pyplot as plt
import sys
from pdb import set_trace

np.random.seed(0)

if len(sys.argv) < 2:
    print("Usage: python xx.py fpath fig_title out_file_name")
    exit(0)

fpath = sys.argv[1]
data = np.loadtxt(fpath, delimiter=',')

nrows = 6
ncols = 8
idxes = np.random.choice(data.shape[0], nrows*ncols)

counter = 1
for i in idxes:
    row = data[i,:]
    pixels = row.reshape(28,28)*255
    pixels = np.clip(pixels,0,255) # fix predictions
    pixels = pixels.astype(np.uint8)
    plt.subplot(nrows, ncols, counter)
    plt.imshow(pixels, cmap='gray')
    counter += 1
    ax = plt.gca()
    ax.axes.xaxis.set_visible(False)
    ax.axes.yaxis.set_visible(False)
    ax.axes.xaxis.set_ticklabels([])
    ax.axes.yaxis.set_ticklabels([])

if len(sys.argv) == 2:
    name = sys.argv[1].split('.')[0]
    plt.savefig(name + '.jpg')
else:
    plt.suptitle(sys.argv[2])
    plt.savefig(sys.argv[3])


#  pick something that is different across model