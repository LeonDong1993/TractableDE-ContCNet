python -u main.py configs/uci/hepmass.ini -dir ./output/uci-09/hepmass/ours -kv "models <- ['ours']; cpus <- 48" | tee -a ./output/uci-09/hepmass/ours/hepmass.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/hepmass/hepmass.h5
       name -> hepmass
loader_name -> hepmass
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
        dir -> ./output/uci-09/hepmass/ours
Loading hepmass data .....
Raw data size:(150000, 21)
Data preparation, elapsed time: 0:00:00
Running our model ....
Total number of hyper-params:48
29-Methods:most_var-30% ## MaxLR:0.01 FR:18 -> RMSE:0.8461 STD:0.4176 
 2-Methods:most_var-10% ## MaxLR:0.025 FR:19 -> RMSE:0.8557 STD:0.3601 
 7-Methods:most_var-10% ## MaxLR:0.01 FR:20 -> RMSE:0.8579 STD:0.3590 <- chosen
 0-Methods:most_var-10% ## MaxLR:0.025 FR:16 -> RMSE:0.8603 STD:0.3654 
27-Methods:most_var-30% ## MaxLR:0.025 FR:20 -> RMSE:0.8609 STD:0.4518 
45-Methods:most_var-40% ## MaxLR:0.004 FR:18 -> RMSE:0.8618 STD:0.4128 
25-Methods:most_var-30% ## MaxLR:0.025 FR:18 -> RMSE:0.8619 STD:0.4299 
11-Methods:most_var-10% ## MaxLR:0.004 FR:20 -> RMSE:0.8645 STD:0.3643 
 3-Methods:most_var-10% ## MaxLR:0.025 FR:20 -> RMSE:0.8646 STD:0.3640 
 5-Methods:most_var-10% ## MaxLR:0.01 FR:18 -> RMSE:0.8649 STD:0.3607 
 8-Methods:most_var-10% ## MaxLR:0.004 FR:16 -> RMSE:0.8651 STD:0.3616 
 6-Methods:most_var-10% ## MaxLR:0.01 FR:19 -> RMSE:0.8655 STD:0.3729 
47-Methods:most_var-40% ## MaxLR:0.004 FR:20 -> RMSE:0.8662 STD:0.4169 
46-Methods:most_var-40% ## MaxLR:0.004 FR:19 -> RMSE:0.8662 STD:0.4128 
 4-Methods:most_var-10% ## MaxLR:0.01 FR:16 -> RMSE:0.8662 STD:0.3627 
 1-Methods:most_var-10% ## MaxLR:0.025 FR:18 -> RMSE:0.8664 STD:0.3650 
 9-Methods:most_var-10% ## MaxLR:0.004 FR:18 -> RMSE:0.8665 STD:0.3672 
41-Methods:most_var-40% ## MaxLR:0.01 FR:18 -> RMSE:0.8674 STD:0.4312 
38-Methods:most_var-40% ## MaxLR:0.025 FR:19 -> RMSE:0.8679 STD:0.4515 
10-Methods:most_var-10% ## MaxLR:0.004 FR:19 -> RMSE:0.8700 STD:0.3695 
40-Methods:most_var-40% ## MaxLR:0.01 FR:16 -> RMSE:0.8718 STD:0.4430 
43-Methods:most_var-40% ## MaxLR:0.01 FR:20 -> RMSE:0.8728 STD:0.4303 
12-Methods:most_var-20% ## MaxLR:0.025 FR:16 -> RMSE:0.8731 STD:0.3879 
37-Methods:most_var-40% ## MaxLR:0.025 FR:18 -> RMSE:0.8732 STD:0.4256 
36-Methods:most_var-40% ## MaxLR:0.025 FR:16 -> RMSE:0.8737 STD:0.4409 
Training under params:
       device -> cpu
        fsize -> 20
       max_LR -> 0.01
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
[E180 time=2.38s lrate=0.00005000 loss=23.29 var=0.00 score=-23.30 best=-23.29 30/30 100.00% 0:01:12+0:00:00]    
model fitting, elapsed time: 0:31:23
Number of edges removed: 116/153 = 75.82%
MixMG number of components: 6
Ours train logmass: p25 -27.835291 median -25.101972 p75 -22.772370 avg -25.633910
Ours test  logmass: p25 -28.089449 median -25.607362 p75 -23.060193 avg -26.011009
Ours logmass computation, elapsed time: 0:00:02
Ours predict, elapsed time: 0:00:05
Ours predict, elapsed time: 0:00:06
Ours predict, elapsed time: 0:00:07
Ours predict, elapsed time: 0:00:07
Ours predict, elapsed time: 0:00:09
Ours predict, elapsed time: 0:00:09
Ours predict, elapsed time: 0:00:06
Ours predict, elapsed time: 0:00:09
Ours predict, elapsed time: 0:00:07
-- Setting 0 -- Ours:0.8010854912443238
-- Setting 1 -- Ours:0.7822896788043332
-- Setting 2 -- Ours:0.7877075919971855
-- Setting 3 -- Ours:0.8465713545180676
-- Setting 4 -- Ours:0.8736847700320862
-- Setting 5 -- Ours:0.8234195113831898
-- Setting 6 -- Ours:0.8778665160352007
-- Setting 7 -- Ours:0.9009027408301926
-- Setting 8 -- Ours:0.9014380461878772

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.8010854912443238

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.7822896788043332

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.7877075919971855

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.8465713545180676

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.8736847700320862

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.8234195113831898

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.8778665160352007

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.9009027408301926

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.9014380461878772
All done, elapsed time: 0:32:34
