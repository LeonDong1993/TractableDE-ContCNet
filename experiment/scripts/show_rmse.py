import sys
import numpy as np

def compute_rmse(a, b):
    assert(a.shape == b.shape)
    sse = np.sum(np.square(a-b))
    mse = sse / a.size
    rmse = np.sqrt(mse)
    return rmse

query = [list(np.arange(14*14).reshape(14,14)[:,a].flatten()) for a in [slice(7,14)]][0]

f1, f2 = sys.argv[1:]

d1 = np.loadtxt(f1, delimiter= ',')
d2 = np.loadtxt(f2, delimiter= ',')

N = d1.shape[0]

rmse = 0
for i in range(N):
    if np.sum(np.abs(d2[i] == np.inf)) > 0:
        print(f"skip item {i}")
    else:
        rmse += compute_rmse(d1[i][query], d2[i][query])

print(rmse / N)


