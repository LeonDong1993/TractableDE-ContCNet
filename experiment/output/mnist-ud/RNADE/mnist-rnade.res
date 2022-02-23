python -u main.py configs/large/mnist.ini -dir ./results/raw/mnist-ud-0929 -kv "models <- ['rnade']; transform <- imgud((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]" | tee -a ./results/raw/mnist-ud-0929/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /home/-----/proj/ccnet
  data_path -> dataset/mnist/digits/
loader_name -> mnist
down_sample -> False
      noise -> False
      label -> False
     scaler -> None
  transform -> ImgUD(DAET-25-28x28)
     device -> gpu
      query -> [[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]]
    missing -> [0.0]
  cache_dir -> ./cache
     models -> ['rnade']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/raw/mnist-ud-0929
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07768581722689402
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:11
Run RNADE ....
Size of hyper-params: 48
#comps:20 weight decay:0.01 lrate:0.025
RNADE fit, elapsed time: 5:51:12
RNADE train logmass: p25 -82.691869 median -73.803595 p75 -64.180363 avg -71.911175
RNADE test  logmass: p25 -84.151705 median -73.041757 p75 -62.499572 avg -71.770598
RNADE logmass computation, elapsed time: 0:00:22
S0, RNADE pred logmass: p25 -66.908038 median -59.679745 p75 -48.859680 avg -56.149794
RNADE predict, elapsed time: 0:03:41
S1, RNADE pred logmass: p25 -67.354605 median -59.874397 p75 -49.949856 avg -56.775902
RNADE predict, elapsed time: 0:03:40
-- Setting 0 -- RNADE:(1.7216874426122164, 0.1706583399440165)
-- Setting 1 -- RNADE:(1.7954199436525076, 0.1669912844982234)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
RNADE (1.7216874426122164, 0.1706583399440165)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
RNADE (1.7954199436525076, 0.1669912844982234)
All done, elapsed time: 5:58:57


