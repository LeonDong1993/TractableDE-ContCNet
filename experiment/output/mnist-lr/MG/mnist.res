python -u main.py configs/large/mnist.ini -dir ./results/mnist-lr/MG -kv "models <- ['gbn']; transform <- imglr((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 8; cpus <- 24" | tee -a ./results/mnist-lr/MG/mnist.res
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
     models -> ['gbn']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 24
       gpus -> 8
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/mnist-lr/MG
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07545147483618228
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:12
Running GBN ....
CLGBN fit, elapsed time: 0:00:01
CLGBN train logmass: p25 -110.259038 median -103.789720 p75 -98.877336 avg -105.321314
CLGBN test  logmass: p25 -111.731575 median -104.421537 p75 -99.244420 avg -105.919174
CLGBN logmass computation, elapsed time: 0:00:46
MG fit, elapsed time: 0:00:00
MG train logmass: p25 35.724512 median 41.686506 p75 46.059622 avg 36.710454
MG test  logmass: p25 36.365800 median 42.015353 p75 46.047613 avg 37.203023
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -96.797405 median -91.896429 p75 -89.321595 avg -93.240739
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 49.039271 median 52.003180 p75 54.147618 avg 49.002788
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -95.156156 median -91.764536 p75 -89.476885 avg -92.779053
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 48.340720 median 51.577062 p75 53.898371 avg 49.551981
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:(2.020476123716218, 0.1996084278119397)
-- Setting 0 -- MG:(1.559797811086146, 0.1698299620759649)
-- Setting 1 -- CLGBN:(2.3514425980187674, 0.19115015700805332)
-- Setting 1 -- MG:(1.8418459897795691, 0.16644163922404245)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
CLGBN (2.020476123716218, 0.1996084278119397)
   MG (1.559797811086146, 0.1698299620759649)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
CLGBN (2.3514425980187674, 0.19115015700805332)
   MG (1.8418459897795691, 0.16644163922404245)
All done, elapsed time: 0:00:49
