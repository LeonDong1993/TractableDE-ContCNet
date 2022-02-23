python -u main.py configs/large/mnist.ini -dir ./results/raw/mnist-lr-0929 -kv "models <- ['rnade']; transform <- imglr((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]" | tee -a ./results/raw/mnist-lr-0929/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /home/------/proj/ccnet
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
        dir -> ./results/raw/mnist-lr-0929
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07545147483618228
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:12
Run RNADE ....
Size of hyper-params: 48
#comps:20 weight decay:0.001 lrate:0.025
RNADE fit, elapsed time: 5:52:08
RNADE train logmass: p25 -85.412717 median -76.149621 p75 -66.138957 avg -74.196687
RNADE test  logmass: p25 -85.133980 median -76.143574 p75 -64.534813 avg -73.418840
RNADE logmass computation, elapsed time: 0:00:22
S0, RNADE pred logmass: p25 -70.765523 median -61.515106 p75 -51.154046 avg -58.960443
RNADE predict, elapsed time: 0:03:36
S1, RNADE pred logmass: p25 -69.442610 median -61.688926 p75 -50.110363 avg -58.109063
RNADE predict, elapsed time: 0:03:38
-- Setting 0 -- RNADE:(1.4277515573091077, 0.1593185336172329)
-- Setting 1 -- RNADE:(1.677006026290102, 0.15217715666242024)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
RNADE (1.4277515573091077, 0.1593185336172329)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
RNADE (1.677006026290102, 0.15217715666242024)
All done, elapsed time: 5:59:46


python -u main.py configs/large/mnist.ini -dir ./results/mnist-lr/RNADE -kv "models <- ['rnade']; transform <- imglr((28,28), DAET,n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 8; cpus <- 24" | tee -a ./results/mnist-lr/RNADE/mnist.res
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
        dir -> ./results/mnist-lr/RNADE
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07545147483618228
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:12
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -85.412717 median -76.149621 p75 -66.138957 avg -74.196687
RNADE test  logmass: p25 -85.133980 median -76.143574 p75 -64.534813 avg -73.418840
RNADE logmass computation, elapsed time: 0:00:22
S0, RNADE pred logmass: p25 -71.072408 median -61.477070 p75 -51.352341 avg -59.099997
RNADE predict, elapsed time: 0:03:40
S1, RNADE pred logmass: p25 -69.486964 median -61.659194 p75 -50.289105 avg -58.061324
RNADE predict, elapsed time: 0:03:43
-- Setting 0 -- RNADE:(1.3911540793318462, 0.15720008616628905)
-- Setting 1 -- RNADE:(1.7177389169921065, 0.1549307836140316)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
RNADE (1.3911540793318462, 0.15720008616628905)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
RNADE (1.7177389169921065, 0.1549307836140316)
All done, elapsed time: 0:07:47
python -u main.py configs/large/mnist.ini -dir ./results/mnist-lr/RNADE -kv "models <- ['rnade']; transform <- imglr((28,28), DAET,n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 8; cpus <- 30" | tee -a ./results/mnist-lr/RNADE/mnist.res
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
     models -> ['rnade']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 30
       gpus -> 8
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/mnist-lr/RNADE
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07545147483618228
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:12
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -85.412717 median -76.149621 p75 -66.138957 avg -74.196687
RNADE test  logmass: p25 -85.133980 median -76.143574 p75 -64.534813 avg -73.418840
RNADE logmass computation, elapsed time: 0:00:22
S0, RNADE pred logmass: p25 -71.072408 median -61.477070 p75 -51.352341 avg -59.099997
RNADE predict, elapsed time: 0:03:36
S1, RNADE pred logmass: p25 -69.486964 median -61.659194 p75 -50.289105 avg -58.061324
RNADE predict, elapsed time: 0:03:38
-- Setting 0 -- RNADE:(1.3911540793318462, 0.15720008616628905)
-- Setting 1 -- RNADE:(1.7177389169921065, 0.1549307836140316)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
RNADE (1.3911540793318462, 0.15720008616628905)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
RNADE (1.7177389169921065, 0.1549307836140316)
All done, elapsed time: 0:07:38
