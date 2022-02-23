python -u main.py configs/uci/parkinson.ini -dir ./output/uci-09/parkinson/ours -kv "models <- ['ours']; cpus <- 48" | tee -a ./output/uci-09/parkinson/ours/parkinson.res
Experiment Configuration:
       name -> parkinson
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/parkinson/parkinsons_updrs.data
loader_name -> parkinson
     device -> cpu
      query -> [0.1, 0.2, 0.3]
    missing -> [0.1, 0.2, 0.3]
      label -> False
     scaler -> StandardScaler()
  transform -> None
  cache_dir -> ./cache
     models -> ['ours']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 48
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./output/uci-09/parkinson/ours
Loading parkinson data .....
Raw data size:(5875, 15)
Data preparation, elapsed time: 0:00:00
Running our model ....
Total number of hyper-params:48
38-Methods:most_var-40% ## MaxLR:0.025 FR:9 -> RMSE:0.3784 STD:0.3324 <- chosen
39-Methods:most_var-40% ## MaxLR:0.025 FR:11 -> RMSE:0.4055 STD:0.3713 
43-Methods:most_var-40% ## MaxLR:0.01 FR:11 -> RMSE:0.4073 STD:0.3785 
36-Methods:most_var-40% ## MaxLR:0.025 FR:6 -> RMSE:0.4217 STD:0.3974 
 6-Methods:most_var-10% ## MaxLR:0.01 FR:9 -> RMSE:0.4242 STD:0.3512 
42-Methods:most_var-40% ## MaxLR:0.01 FR:9 -> RMSE:0.4265 STD:0.4082 
27-Methods:most_var-30% ## MaxLR:0.025 FR:11 -> RMSE:0.4321 STD:0.3835 
44-Methods:most_var-40% ## MaxLR:0.004 FR:6 -> RMSE:0.4330 STD:0.4084 
40-Methods:most_var-40% ## MaxLR:0.01 FR:6 -> RMSE:0.4338 STD:0.4049 
12-Methods:most_var-20% ## MaxLR:0.025 FR:6 -> RMSE:0.4371 STD:0.3619 
18-Methods:most_var-20% ## MaxLR:0.01 FR:9 -> RMSE:0.4385 STD:0.3869 
41-Methods:most_var-40% ## MaxLR:0.01 FR:7 -> RMSE:0.4395 STD:0.4021 
29-Methods:most_var-30% ## MaxLR:0.01 FR:7 -> RMSE:0.4423 STD:0.4039 
47-Methods:most_var-40% ## MaxLR:0.004 FR:11 -> RMSE:0.4423 STD:0.3992 
14-Methods:most_var-20% ## MaxLR:0.025 FR:9 -> RMSE:0.4444 STD:0.3800 
16-Methods:most_var-20% ## MaxLR:0.01 FR:6 -> RMSE:0.4451 STD:0.3949 
19-Methods:most_var-20% ## MaxLR:0.01 FR:11 -> RMSE:0.4454 STD:0.3875 
 7-Methods:most_var-10% ## MaxLR:0.01 FR:11 -> RMSE:0.4454 STD:0.3973 
17-Methods:most_var-20% ## MaxLR:0.01 FR:7 -> RMSE:0.4461 STD:0.3821 
13-Methods:most_var-20% ## MaxLR:0.025 FR:7 -> RMSE:0.4464 STD:0.3876 
31-Methods:most_var-30% ## MaxLR:0.01 FR:11 -> RMSE:0.4467 STD:0.3958 
37-Methods:most_var-40% ## MaxLR:0.025 FR:7 -> RMSE:0.4475 STD:0.4160 
35-Methods:most_var-30% ## MaxLR:0.004 FR:11 -> RMSE:0.4488 STD:0.3861 
15-Methods:most_var-20% ## MaxLR:0.025 FR:11 -> RMSE:0.4496 STD:0.3945 
24-Methods:most_var-30% ## MaxLR:0.025 FR:6 -> RMSE:0.4554 STD:0.4082 
Training under params:
       device -> cpu
        fsize -> 9
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
[E180 time=0.33s lrate=0.00012500 loss=-4.34 var=0.22 score=4.11 best=4.20 30/30 100.00% 0:00:09+0:00:00]    
model fitting, elapsed time: 0:06:56
Number of edges removed: 0/28 = 0.00%
MixMG number of components: 10
Ours train logmass: p25 -4.421304 median -0.619572 p75 2.042631 avg -1.981735
Ours test  logmass: p25 -5.365429 median -1.326492 p75 1.561671 avg -3.313013
Ours logmass computation, elapsed time: 0:00:00
Ours predict, elapsed time: 0:00:07
Ours predict, elapsed time: 0:00:09
Ours predict, elapsed time: 0:00:07
Ours predict, elapsed time: 0:00:08
Ours predict, elapsed time: 0:00:08
Ours predict, elapsed time: 0:00:08
Ours predict, elapsed time: 0:00:08
Ours predict, elapsed time: 0:00:08
Ours predict, elapsed time: 0:00:08
-- Setting 0 -- Ours:0.24315455179473489
-- Setting 1 -- Ours:0.35649480092468283
-- Setting 2 -- Ours:0.31218304806115627
-- Setting 3 -- Ours:0.3823709887797891
-- Setting 4 -- Ours:0.38230737121638386
-- Setting 5 -- Ours:0.38353097525558644
-- Setting 6 -- Ours:0.4184038681440525
-- Setting 7 -- Ours:0.46059691856755164
-- Setting 8 -- Ours:0.42147815513370174

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.24315455179473489

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.35649480092468283

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.31218304806115627

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.3823709887797891

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.38230737121638386

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.38353097525558644

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.4184038681440525

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.46059691856755164

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.42147815513370174
All done, elapsed time: 0:08:12
