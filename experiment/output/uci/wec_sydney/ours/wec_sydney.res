python -u main.py configs/uci/wec_sydney.ini -dir ./output/uci-09/wec_sydney/ours -kv "models <- ['ours']; cpus <- 48" | tee -a ./output/uci-09/wec_sydney/ours/wec_sydney.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/WEC_sydney/Sydney_Data.csv
       name -> WEC_sydney
loader_name -> WEC_sydney
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
        dir -> ./output/uci-09/wec_sydney/ours
Loading WEC-Sydney data .....
Raw data size:(72000, 49)
Data preparation, elapsed time: 0:00:02
Running our model ....
Total number of hyper-params:48
15-Methods:most_var-20% ## MaxLR:0.025 FR:45 -> RMSE:0.4810 STD:0.3463 <- chosen
14-Methods:most_var-20% ## MaxLR:0.025 FR:39 -> RMSE:0.4910 STD:0.3576 
12-Methods:most_var-20% ## MaxLR:0.025 FR:28 -> RMSE:0.4925 STD:0.3432 
17-Methods:most_var-20% ## MaxLR:0.01 FR:34 -> RMSE:0.4931 STD:0.3610 
13-Methods:most_var-20% ## MaxLR:0.025 FR:34 -> RMSE:0.4964 STD:0.3547 
 0-Methods:most_var-10% ## MaxLR:0.025 FR:28 -> RMSE:0.5006 STD:0.3575 
19-Methods:most_var-20% ## MaxLR:0.01 FR:45 -> RMSE:0.5023 STD:0.3686 
16-Methods:most_var-20% ## MaxLR:0.01 FR:28 -> RMSE:0.5032 STD:0.3618 
21-Methods:most_var-20% ## MaxLR:0.004 FR:34 -> RMSE:0.5032 STD:0.3557 
18-Methods:most_var-20% ## MaxLR:0.01 FR:39 -> RMSE:0.5037 STD:0.3721 
22-Methods:most_var-20% ## MaxLR:0.004 FR:39 -> RMSE:0.5048 STD:0.3688 
24-Methods:most_var-30% ## MaxLR:0.025 FR:28 -> RMSE:0.5051 STD:0.3621 
23-Methods:most_var-20% ## MaxLR:0.004 FR:45 -> RMSE:0.5052 STD:0.3582 
 2-Methods:most_var-10% ## MaxLR:0.025 FR:39 -> RMSE:0.5061 STD:0.3659 
 5-Methods:most_var-10% ## MaxLR:0.01 FR:34 -> RMSE:0.5068 STD:0.3568 
 1-Methods:most_var-10% ## MaxLR:0.025 FR:34 -> RMSE:0.5071 STD:0.3695 
 7-Methods:most_var-10% ## MaxLR:0.01 FR:45 -> RMSE:0.5078 STD:0.3672 
 4-Methods:most_var-10% ## MaxLR:0.01 FR:28 -> RMSE:0.5090 STD:0.3630 
10-Methods:most_var-10% ## MaxLR:0.004 FR:39 -> RMSE:0.5120 STD:0.3555 
 9-Methods:most_var-10% ## MaxLR:0.004 FR:34 -> RMSE:0.5122 STD:0.3522 
44-Methods:most_var-40% ## MaxLR:0.004 FR:28 -> RMSE:0.5123 STD:0.3531 
 6-Methods:most_var-10% ## MaxLR:0.01 FR:39 -> RMSE:0.5134 STD:0.3753 
20-Methods:most_var-20% ## MaxLR:0.004 FR:28 -> RMSE:0.5138 STD:0.3695 
 3-Methods:most_var-10% ## MaxLR:0.025 FR:45 -> RMSE:0.5144 STD:0.3684 
40-Methods:most_var-40% ## MaxLR:0.01 FR:28 -> RMSE:0.5156 STD:0.3534 
Training under params:
       device -> cpu
        fsize -> 45
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
[E180 time=6.64s lrate=0.00012500 loss=11.45 var=0.67 score=-12.12 best=-12.05 30/30 100.00% 0:03:24+0:00:00]    
model fitting, elapsed time: 1:32:12
Number of edges removed: 206/703 = 29.30%
MixMG number of components: 10
Ours train logmass: p25 -57.807097 median -34.913195 p75 15.302693 avg -21.370254
Ours test  logmass: p25 -58.978328 median -40.398641 p75 14.991462 avg -24.118622
Ours logmass computation, elapsed time: 0:00:03
Ours predict, elapsed time: 0:00:18
Ours predict, elapsed time: 0:00:19
Ours predict, elapsed time: 0:00:28
Ours predict, elapsed time: 0:00:19
Ours predict, elapsed time: 0:00:29
Ours predict, elapsed time: 0:00:28
Ours predict, elapsed time: 0:00:25
Ours predict, elapsed time: 0:00:29
Ours predict, elapsed time: 0:00:36
-- Setting 0 -- Ours:0.436837073353309
-- Setting 1 -- Ours:0.45539962987226607
-- Setting 2 -- Ours:0.5096705961198152
-- Setting 3 -- Ours:0.4769470323549484
-- Setting 4 -- Ours:0.5249163968649512
-- Setting 5 -- Ours:0.532777305468048
-- Setting 6 -- Ours:0.5274608554986768
-- Setting 7 -- Ours:0.5419838007414949
-- Setting 8 -- Ours:0.5938178186920939

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.436837073353309

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.45539962987226607

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.5096705961198152

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.4769470323549484

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.5249163968649512

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.532777305468048

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.5274608554986768

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.5419838007414949

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.5938178186920939
All done, elapsed time: 1:36:11
