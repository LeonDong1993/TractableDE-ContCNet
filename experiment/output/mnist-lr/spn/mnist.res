python -u main.py configs/large/mnist.ini -dir ./results/raw/mnist-lr-0929 -kv "models <- ['gbn','ours','spnet']; transform <- imglr((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1,2); gpus <- 8; cpus <- 32" | tee -a ./results/raw/mnist-lr-0929/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /data/lab/---------/ccnet
  data_path -> dataset/mnist/digits/
loader_name -> mnist
down_sample -> False
      noise -> False
      label -> False
     scaler -> None
  transform -> ImgLR(DAET-25-28x28)
     device -> gpu
      query -> [[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]]
    missing -> [0.0]
  cache_dir -> ./cache
     models -> ['gbn', 'ours', 'spnet']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 32
       gpus -> 8
      gpuid -> (0, 1, 2)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/raw/mnist-lr-0929
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07545147483618228
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:11
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:gmm col split:rdc
spnflow fit, elapsed time: 3:13:55
spnflow train logmass: p25 -89.479124 median -79.346879 p75 -68.205478 avg -76.633732
spnflow test  logmass: p25 -90.761433 median -80.341938 p75 -68.148062 avg -77.708393
spnflow logmass computation, elapsed time: 0:05:14
S0, SPN pred logmass: p25 -74.090622 median -64.286014 p75 -54.134483 avg -61.856210
spnflow predict, elapsed time: 0:02:34
S1, SPN pred logmass: p25 -74.453283 median -64.785701 p75 -53.690935 avg -60.996688
spnflow predict, elapsed time: 0:02:34
-- Setting 0 -- spnflow:(1.3970124959240837, 0.16029237459531231)
-- Setting 1 -- spnflow:(1.6542266735482323, 0.1540365909064763)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
spnflow (1.3970124959240837, 0.16029237459531231)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
spnflow (1.6542266735482323, 0.1540365909064763)
All done, elapsed time: 4:52:11


python -u main.py configs/large/mnist.ini -dir ./results/mnist-lr/spn -kv "models <- ['spnet']; transform <- imglr((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 8; cpus <- 24" | tee -a ./results/mnist-lr/spn/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/mnist/digits/
loader_name -> mnist
down_sample -> False
      noise -> False
      label -> False
     scaler -> None
  transform -> ImgLR(DAET-25-28x28)
     device -> gpu
      query -> [[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]]
    missing -> [0.0]
  cache_dir -> ./cache
     models -> ['spnet']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 24
       gpus -> 8
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/mnist-lr/spn
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07545147483618228
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:12
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 -89.479124 median -79.346879 p75 -68.205478 avg -76.633732
spnflow test  logmass: p25 -90.761433 median -80.341938 p75 -68.148062 avg -77.708393
spnflow logmass computation, elapsed time: 0:05:09
S0, SPN pred logmass: p25 -74.090622 median -64.286014 p75 -54.134483 avg -61.856210
spnflow predict, elapsed time: 0:03:47
S1, SPN pred logmass: p25 -74.453283 median -64.785701 p75 -53.690935 avg -60.996688
spnflow predict, elapsed time: 0:03:45
-- Setting 0 -- spnflow:(1.3970124959240837, 0.16029237459531231)
-- Setting 1 -- spnflow:(1.6542266735482323, 0.1540365909064763)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
spnflow (1.3970124959240837, 0.16029237459531231)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
spnflow (1.6542266735482323, 0.1540365909064763)
All done, elapsed time: 0:12:42
