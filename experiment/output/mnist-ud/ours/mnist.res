python -u main.py configs/large/mnist.ini -dir ./output/oct-09/imgud-2 -kv "models <- ['ours']; transform <- imgud((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 12; cpus <- 48; device <- 'cpu'" | tee -a ./output/oct-09/imgud-2/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/mnist/digits/
loader_name -> mnist
down_sample -> False
      noise -> False
      label -> False
     scaler -> None
  transform -> ImgUD(DAET-25-28x28)
     device -> cpu
      query -> [[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]]
    missing -> [0.0]
  cache_dir -> ./cache
     models -> ['ours']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 48
       gpus -> 12
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./output/oct-09/imgud-2
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.077685817226894
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:11
Running our model ....
python -u main.py configs/large/mnist.ini -dir ./output/oct-09/imgud-2 -kv "models <- ['ours']; transform <- imgud((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 12; cpus <- 24; device <- 'cpu'" | tee -a ./output/oct-09/imgud-2/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/mnist/digits/
loader_name -> mnist
down_sample -> False
      noise -> False
      label -> False
     scaler -> None
  transform -> ImgUD(DAET-25-28x28)
     device -> cpu
      query -> [[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]]
    missing -> [0.0]
  cache_dir -> ./cache
     models -> ['ours']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 24
       gpus -> 12
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./output/oct-09/imgud-2
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.077685817226894
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:12
Running our model ....
Total number of hyper-params:12
 3-Methods:most_var-20% ## MaxLR:0.025 FR:50 -> RMSE:1.5887 STD:0.7248 <- chosen
 6-Methods:most_var-30% ## MaxLR:0.025 FR:50 -> RMSE:1.6716 STD:0.8067 
 7-Methods:most_var-30% ## MaxLR:0.01 FR:50 -> RMSE:1.6773 STD:0.7398 
 5-Methods:most_var-20% ## MaxLR:0.004 FR:50 -> RMSE:1.6835 STD:0.7062 
 8-Methods:most_var-30% ## MaxLR:0.004 FR:50 -> RMSE:1.7011 STD:0.8136 
 9-Methods:most_var-40% ## MaxLR:0.025 FR:50 -> RMSE:1.7258 STD:0.7996 
11-Methods:most_var-40% ## MaxLR:0.004 FR:50 -> RMSE:1.7280 STD:0.8321 
 2-Methods:most_var-10% ## MaxLR:0.004 FR:50 -> RMSE:1.7337 STD:0.6631 
 0-Methods:most_var-10% ## MaxLR:0.025 FR:50 -> RMSE:1.7341 STD:0.7767 
10-Methods:most_var-40% ## MaxLR:0.01 FR:50 -> RMSE:1.7406 STD:0.7939 
Training under params:
       device -> cpu
        fsize -> 50
       max_LR -> 0.025
        model -> (3, 2.5)
    pre_train -> (4, 15)
   var_thresh -> 0.005
    learn_std -> True
 group_header -> True
linear_header -> False
   batch_size -> 100
    batch_num -> 50
   init_epoch -> 5
   last_epoch -> 36
    max_epoch -> 180
 weight_decay -> 0.001
  corr_thresh -> 0.05
    drop_prob -> 0.0
[E180 time=8.05s lrate=0.00012500 loss=-7.46 var=0.72 score=6.74 best=7.08 30/30 100.00% 0:04:00+0:00:00]    
model fitting, elapsed time: 1:09:44
Number of edges removed: 124/741 = 16.73%
MixMG number of components: 10
Ours train logmass: p25 -22.137770 median -14.384556 p75 -5.267989 avg -12.856433
Ours test  logmass: p25 -23.113279 median -13.564092 p75 -4.319835 avg -12.727226
Ours logmass computation, elapsed time: 0:00:03
S0, Ours pred logmass: p25 -9.402509 median -3.046511 p75 5.897634 avg -0.547642
Ours predict, elapsed time: 0:00:32
S1, Ours pred logmass: p25 -10.530502 median -3.792438 p75 5.624077 avg -0.796453
Ours predict, elapsed time: 0:00:50
-- Setting 0 -- Ours:(1.5393711883606176, 0.15731283988276204)
-- Setting 1 -- Ours:(1.6243600433199001, 0.15801233846334603)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
Ours (1.5393711883606176, 0.15731283988276204)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
Ours (1.6243600433199001, 0.15801233846334603)
All done, elapsed time: 1:11:12
