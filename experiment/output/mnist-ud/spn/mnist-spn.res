python -u main.py configs/large/mnist.ini -dir ./results/raw/mnist-ud-0929 -kv "models <- ['gbn','ours','spnet']; transform <- imgud((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1,2); gpus <- 8; cpus <- 32" | tee -a ./results/raw/mnist-ud-0929/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /data/lab/-----/ccnet
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
        dir -> ./results/raw/mnist-ud-0929
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07768581722689402
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:10
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:kmeans col split:rdc
spnflow fit, elapsed time: 3:12:26
spnflow train logmass: p25 -89.045866 median -79.070647 p75 -68.201313 avg -76.526401
spnflow test  logmass: p25 -93.223186 median -81.867966 p75 -68.293149 avg -78.908864
spnflow logmass computation, elapsed time: 0:05:11
S0, SPN pred logmass: p25 -73.886409 median -66.058055 p75 -55.485116 avg -62.004256
spnflow predict, elapsed time: 0:02:32
S1, SPN pred logmass: p25 -72.334594 median -64.596958 p75 -53.674284 avg -60.271082
spnflow predict, elapsed time: 0:02:35
-- Setting 0 -- spnflow:(1.7165104708599757, 0.17192620615616147)
-- Setting 1 -- spnflow:(1.7013491856203884, 0.16402988092446535)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
spnflow (1.7165104708599757, 0.17192620615616147)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
spnflow (1.7013491856203884, 0.16402988092446535)

