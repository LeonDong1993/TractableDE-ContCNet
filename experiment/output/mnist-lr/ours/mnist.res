python -u main.py configs/large/mnist.ini -dir ./output/oct-09/imglr-2 -kv "models <- ['ours']; transform <- imglr((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 12; cpus <- 24; device <- 'cpu'" | tee -a ./output/oct-09/imglr-2/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/mnist/digits/
loader_name -> mnist
down_sample -> False
      noise -> False
      label -> False
     scaler -> None
  transform -> ImgLR(DAET-25-28x28)
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
        dir -> ./output/oct-09/imglr-2
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07545147483618231
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:12
Running our model ....
Total number of hyper-params:12
 3-Methods:most_var-20% ## MaxLR:0.025 FR:50 -> RMSE:1.4196 STD:0.6170 
 6-Methods:most_var-30% ## MaxLR:0.025 FR:50 -> RMSE:1.4419 STD:0.6028 <- chosen
 4-Methods:most_var-20% ## MaxLR:0.01 FR:50 -> RMSE:1.4693 STD:0.5641 
 5-Methods:most_var-20% ## MaxLR:0.004 FR:50 -> RMSE:1.5211 STD:0.6060 
 1-Methods:most_var-10% ## MaxLR:0.01 FR:50 -> RMSE:1.5278 STD:0.5754 
 0-Methods:most_var-10% ## MaxLR:0.025 FR:50 -> RMSE:1.5297 STD:0.6011 
10-Methods:most_var-40% ## MaxLR:0.01 FR:50 -> RMSE:1.5386 STD:0.6471 
 9-Methods:most_var-40% ## MaxLR:0.025 FR:50 -> RMSE:1.5390 STD:0.6182 
11-Methods:most_var-40% ## MaxLR:0.004 FR:50 -> RMSE:1.5415 STD:0.6392 
 8-Methods:most_var-30% ## MaxLR:0.004 FR:50 -> RMSE:1.5546 STD:0.5766 
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
[E180 time=6.56s lrate=0.00012500 loss=-0.78 var=0.86 score=-0.09 best=0.66 30/30 100.00% 0:03:18+0:00:00]    
model fitting, elapsed time: 0:59:21
Number of edges removed: 83/561 = 14.80%
MixMG number of components: 10
Ours train logmass: p25 -34.617997 median -25.495860 p75 -15.824366 avg -24.073139
Ours test  logmass: p25 -35.325918 median -25.788246 p75 -16.790597 avg -25.331268
Ours logmass computation, elapsed time: 0:00:03
S0, Ours pred logmass: p25 -22.574307 median -14.727168 p75 -6.999636 avg -13.107869
Ours predict, elapsed time: 0:00:46
S1, Ours pred logmass: p25 -21.550967 median -12.586972 p75 -4.490644 avg -11.381116
Ours predict, elapsed time: 0:00:27
-- Setting 0 -- Ours:(1.4329185849128263, 0.1610003571249252)
-- Setting 1 -- Ours:(1.4978627547044658, 0.14366126455468692)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
Ours (1.4329185849128263, 0.1610003571249252)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
Ours (1.4978627547044658, 0.14366126455468692)
All done, elapsed time: 1:00:39
