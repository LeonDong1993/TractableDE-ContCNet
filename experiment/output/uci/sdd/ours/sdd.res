python -u main.py configs/uci/sdd.ini -dir ./output/uci-09/sdd/ours -kv "models <- ['ours']; cpus <- 48" | tee -a ./output/uci-09/sdd/ours/sdd.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/SDD/Sensorless_drive_diagnosis.txt
       name -> sensorless_drive
loader_name -> SDD
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
        dir -> ./output/uci-09/sdd/ours
Loading Sensorless_drive_diagnosis data .....
Raw data size:(58509, 29)
Data preparation, elapsed time: 0:00:01
Running our model ....
Total number of hyper-params:48
46-Methods:most_var-40% ## MaxLR:0.004 FR:22 -> RMSE:0.8909 STD:3.9137 <- chosen
42-Methods:most_var-40% ## MaxLR:0.01 FR:22 -> RMSE:0.9079 STD:4.7447 
41-Methods:most_var-40% ## MaxLR:0.01 FR:20 -> RMSE:0.9146 STD:4.7630 
30-Methods:most_var-30% ## MaxLR:0.01 FR:22 -> RMSE:0.9410 STD:4.9650 
37-Methods:most_var-40% ## MaxLR:0.025 FR:20 -> RMSE:0.9580 STD:5.0756 
29-Methods:most_var-30% ## MaxLR:0.01 FR:20 -> RMSE:0.9701 STD:4.7594 
18-Methods:most_var-20% ## MaxLR:0.01 FR:22 -> RMSE:0.9702 STD:5.0355 
35-Methods:most_var-30% ## MaxLR:0.004 FR:25 -> RMSE:0.9738 STD:5.2693 
24-Methods:most_var-30% ## MaxLR:0.025 FR:17 -> RMSE:0.9887 STD:5.4908 
11-Methods:most_var-10% ## MaxLR:0.004 FR:25 -> RMSE:0.9918 STD:6.0320 
39-Methods:most_var-40% ## MaxLR:0.025 FR:25 -> RMSE:0.9926 STD:5.7845 
 3-Methods:most_var-10% ## MaxLR:0.025 FR:25 -> RMSE:0.9929 STD:6.3140 
34-Methods:most_var-30% ## MaxLR:0.004 FR:22 -> RMSE:1.0009 STD:5.6123 
33-Methods:most_var-30% ## MaxLR:0.004 FR:20 -> RMSE:1.0057 STD:5.4105 
47-Methods:most_var-40% ## MaxLR:0.004 FR:25 -> RMSE:1.0091 STD:5.7881 
45-Methods:most_var-40% ## MaxLR:0.004 FR:20 -> RMSE:1.0174 STD:5.8282 
25-Methods:most_var-30% ## MaxLR:0.025 FR:20 -> RMSE:1.0250 STD:6.3177 
 4-Methods:most_var-10% ## MaxLR:0.01 FR:17 -> RMSE:1.0254 STD:6.6002 
28-Methods:most_var-30% ## MaxLR:0.01 FR:17 -> RMSE:1.0395 STD:5.7284 
44-Methods:most_var-40% ## MaxLR:0.004 FR:17 -> RMSE:1.0540 STD:6.2696 
27-Methods:most_var-30% ## MaxLR:0.025 FR:25 -> RMSE:1.0660 STD:6.4086 
21-Methods:most_var-20% ## MaxLR:0.004 FR:20 -> RMSE:1.0701 STD:6.6795 
26-Methods:most_var-30% ## MaxLR:0.025 FR:22 -> RMSE:1.0839 STD:6.9917 
 1-Methods:most_var-10% ## MaxLR:0.025 FR:20 -> RMSE:1.0845 STD:7.1446 
20-Methods:most_var-20% ## MaxLR:0.004 FR:17 -> RMSE:1.1294 STD:6.9410 
Training under params:
       device -> cpu
        fsize -> 22
       max_LR -> 0.004
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
[E180 time=1.44s lrate=0.00002000 loss=1.20 var=6.78 score=-7.99 best=-1.80 30/30 100.00% 0:00:42+0:00:00]    
model fitting, elapsed time: 0:26:44
Number of edges removed: 45/120 = 37.50%
MixMG number of components: 10
Ours train logmass: p25 -15.172452 median -8.589789 p75 -3.237069 avg -11.255929
Ours test  logmass: p25 -14.051787 median -7.446456 p75 -2.505320 avg -8.882135
Ours logmass computation, elapsed time: 0:00:01
Ours predict, elapsed time: 0:00:10
Ours predict, elapsed time: 0:00:10
Ours predict, elapsed time: 0:00:15
Ours predict, elapsed time: 0:00:13
Ours predict, elapsed time: 0:00:15
Ours predict, elapsed time: 0:00:18
Ours predict, elapsed time: 0:00:11
Ours predict, elapsed time: 0:00:13
Ours predict, elapsed time: 0:00:16
-- Setting 0 -- Ours:0.5087824708371397
-- Setting 1 -- Ours:0.47971295404098596
-- Setting 2 -- Ours:0.4883543657402765
-- Setting 3 -- Ours:0.5232368827241354
-- Setting 4 -- Ours:0.5130250243481909
-- Setting 5 -- Ours:0.5525342854979614
-- Setting 6 -- Ours:0.571604677356294
-- Setting 7 -- Ours:0.5714073503647428
-- Setting 8 -- Ours:0.5889471980951754

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.5087824708371397

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.47971295404098596

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.4883543657402765

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.5232368827241354

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.5130250243481909

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.5525342854979614

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.571604677356294

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.5714073503647428

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.5889471980951754
All done, elapsed time: 0:28:50
