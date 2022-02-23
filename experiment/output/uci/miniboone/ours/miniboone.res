python -u main.py configs/uci/miniboone.ini -dir ./output/uci-09/miniboone/ours -kv "models <- ['ours']; cpus <- 48" | tee -a ./output/uci-09/miniboone/ours/miniboone.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/miniboone/miniboone.h5
       name -> miniboone
loader_name -> miniboone
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
        dir -> ./output/uci-09/miniboone/ours
Loading miniboone data .....
Raw data size:(36488, 43)
Data preparation, elapsed time: 0:00:00
Running our model ....
Total number of hyper-params:48
15-Methods:most_var-20% ## MaxLR:0.025 FR:35 -> RMSE:0.4148 STD:0.3715 <- chosen
19-Methods:most_var-20% ## MaxLR:0.01 FR:35 -> RMSE:0.4186 STD:0.3749 
24-Methods:most_var-30% ## MaxLR:0.025 FR:18 -> RMSE:0.4282 STD:0.3776 
27-Methods:most_var-30% ## MaxLR:0.025 FR:35 -> RMSE:0.4301 STD:0.3804 
31-Methods:most_var-30% ## MaxLR:0.01 FR:35 -> RMSE:0.4303 STD:0.3874 
12-Methods:most_var-20% ## MaxLR:0.025 FR:18 -> RMSE:0.4310 STD:0.3768 
13-Methods:most_var-20% ## MaxLR:0.025 FR:25 -> RMSE:0.4335 STD:0.3809 
30-Methods:most_var-30% ## MaxLR:0.01 FR:29 -> RMSE:0.4337 STD:0.3843 
14-Methods:most_var-20% ## MaxLR:0.025 FR:29 -> RMSE:0.4343 STD:0.3992 
21-Methods:most_var-20% ## MaxLR:0.004 FR:25 -> RMSE:0.4349 STD:0.3897 
23-Methods:most_var-20% ## MaxLR:0.004 FR:35 -> RMSE:0.4364 STD:0.3983 
17-Methods:most_var-20% ## MaxLR:0.01 FR:25 -> RMSE:0.4371 STD:0.3922 
39-Methods:most_var-40% ## MaxLR:0.025 FR:35 -> RMSE:0.4382 STD:0.3799 
38-Methods:most_var-40% ## MaxLR:0.025 FR:29 -> RMSE:0.4385 STD:0.3811 
 3-Methods:most_var-10% ## MaxLR:0.025 FR:35 -> RMSE:0.4395 STD:0.3168 
18-Methods:most_var-20% ## MaxLR:0.01 FR:29 -> RMSE:0.4396 STD:0.3840 
25-Methods:most_var-30% ## MaxLR:0.025 FR:25 -> RMSE:0.4410 STD:0.3860 
 6-Methods:most_var-10% ## MaxLR:0.01 FR:29 -> RMSE:0.4412 STD:0.3266 
37-Methods:most_var-40% ## MaxLR:0.025 FR:25 -> RMSE:0.4413 STD:0.3748 
29-Methods:most_var-30% ## MaxLR:0.01 FR:25 -> RMSE:0.4413 STD:0.3914 
 7-Methods:most_var-10% ## MaxLR:0.01 FR:35 -> RMSE:0.4428 STD:0.3182 
 4-Methods:most_var-10% ## MaxLR:0.01 FR:18 -> RMSE:0.4435 STD:0.3147 
41-Methods:most_var-40% ## MaxLR:0.01 FR:25 -> RMSE:0.4442 STD:0.3854 
 1-Methods:most_var-10% ## MaxLR:0.025 FR:25 -> RMSE:0.4443 STD:0.3130 
42-Methods:most_var-40% ## MaxLR:0.01 FR:29 -> RMSE:0.4447 STD:0.3931 
Training under params:
       device -> cpu
        fsize -> 35
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
[E180 time=3.23s lrate=0.00012500 loss=7.38 var=0.15 score=-7.53 best=-7.42 30/30 100.00% 0:01:36+0:00:00]    
model fitting, elapsed time: 0:38:46
Number of edges removed: 59/528 = 11.17%
MixMG number of components: 10
Ours train logmass: p25 -23.508566 median -15.000684 p75 -7.029359 avg -16.073509
Ours test  logmass: p25 -28.203958 median -18.293660 p75 -9.450446 avg -21.421112
Ours logmass computation, elapsed time: 0:00:01
Ours predict, elapsed time: 0:00:13
Ours predict, elapsed time: 0:00:21
Ours predict, elapsed time: 0:00:24
Ours predict, elapsed time: 0:00:21
Ours predict, elapsed time: 0:00:21
Ours predict, elapsed time: 0:00:21
Ours predict, elapsed time: 0:00:24
Ours predict, elapsed time: 0:00:25
Ours predict, elapsed time: 0:00:29
-- Setting 0 -- Ours:0.3854005044755536
-- Setting 1 -- Ours:0.38480823361901345
-- Setting 2 -- Ours:0.395658682329281
-- Setting 3 -- Ours:0.43486371915496747
-- Setting 4 -- Ours:0.42867688972536483
-- Setting 5 -- Ours:0.4604059591046356
-- Setting 6 -- Ours:0.4385675123510299
-- Setting 7 -- Ours:0.46331821910752713
-- Setting 8 -- Ours:0.5059167094282592

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.3854005044755536

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.38480823361901345

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.395658682329281

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.43486371915496747

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.42867688972536483

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.4604059591046356

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.4385675123510299

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.46331821910752713

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.5059167094282592
All done, elapsed time: 0:42:11
