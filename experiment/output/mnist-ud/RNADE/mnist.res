python -u main.py configs/large/mnist.ini -dir ./results/mnist-ud/RNADE -kv "models <- ['rnade']; transform <- imgud((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 8; cpus <- 24" | tee -a ./results/mnist-ud/RNADE/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /home/leondong/proj/ccnet
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
       cpus -> 24
       gpus -> 8
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/mnist-ud/RNADE
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07768581722689402
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:11
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -82.691869 median -73.803595 p75 -64.180363 avg -71.911175
RNADE test  logmass: p25 -84.151705 median -73.041757 p75 -62.499572 avg -71.770598
RNADE logmass computation, elapsed time: 0:00:24
S0, RNADE pred logmass: p25 -66.694388 median -59.806072 p75 -48.103260 avg -56.063423
RNADE predict, elapsed time: 0:03:37
S1, RNADE pred logmass: p25 -68.001877 median -60.696870 p75 -49.306605 avg -56.889683
RNADE predict, elapsed time: 0:03:45
-- Setting 0 -- RNADE:(1.7424738075434032, 0.1699065297341414)
-- Setting 1 -- RNADE:(1.7827956600649844, 0.16593872161921108)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
RNADE (1.7424738075434032, 0.1699065297341414)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
RNADE (1.7827956600649844, 0.16593872161921108)
All done, elapsed time: 0:07:47
