python -u main.py configs/uci/superconduct.ini -dir ./output/uci-09/superconduct/ours -kv "models <- ['ours']; cpus <- 48" | tee -a ./output/uci-09/superconduct/ours/superconduct.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/superconduct/data.csv
       name -> superconduct
loader_name -> superconduct
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
        dir -> ./output/uci-09/superconduct/ours
Loading the superconduct data.....
Raw data size:(21263, 68)
Data preparation, elapsed time: 0:00:02
Running our model ....
Total number of hyper-params:48
 3-Methods:most_var-10% ## MaxLR:0.025 FR:31 -> RMSE:0.1039 STD:0.1117 <- chosen
 7-Methods:most_var-10% ## MaxLR:0.01 FR:31 -> RMSE:0.1140 STD:0.1168 
 2-Methods:most_var-10% ## MaxLR:0.025 FR:21 -> RMSE:0.1164 STD:0.1167 
15-Methods:most_var-20% ## MaxLR:0.025 FR:31 -> RMSE:0.1186 STD:0.1158 
 6-Methods:most_var-10% ## MaxLR:0.01 FR:21 -> RMSE:0.1210 STD:0.1136 
11-Methods:most_var-10% ## MaxLR:0.004 FR:31 -> RMSE:0.1240 STD:0.1141 
 1-Methods:most_var-10% ## MaxLR:0.025 FR:17 -> RMSE:0.1240 STD:0.1146 
 5-Methods:most_var-10% ## MaxLR:0.01 FR:17 -> RMSE:0.1273 STD:0.1170 
14-Methods:most_var-20% ## MaxLR:0.025 FR:21 -> RMSE:0.1287 STD:0.1189 
19-Methods:most_var-20% ## MaxLR:0.01 FR:31 -> RMSE:0.1302 STD:0.1214 
 0-Methods:most_var-10% ## MaxLR:0.025 FR:12 -> RMSE:0.1328 STD:0.1255 
13-Methods:most_var-20% ## MaxLR:0.025 FR:17 -> RMSE:0.1405 STD:0.1228 
39-Methods:most_var-40% ## MaxLR:0.025 FR:31 -> RMSE:0.1406 STD:0.1272 
10-Methods:most_var-10% ## MaxLR:0.004 FR:21 -> RMSE:0.1423 STD:0.1299 
18-Methods:most_var-20% ## MaxLR:0.01 FR:21 -> RMSE:0.1429 STD:0.1290 
23-Methods:most_var-20% ## MaxLR:0.004 FR:31 -> RMSE:0.1444 STD:0.1249 
26-Methods:most_var-30% ## MaxLR:0.025 FR:21 -> RMSE:0.1446 STD:0.1273 
12-Methods:most_var-20% ## MaxLR:0.025 FR:12 -> RMSE:0.1472 STD:0.1309 
43-Methods:most_var-40% ## MaxLR:0.01 FR:31 -> RMSE:0.1493 STD:0.1244 
38-Methods:most_var-40% ## MaxLR:0.025 FR:21 -> RMSE:0.1524 STD:0.1351 
 4-Methods:most_var-10% ## MaxLR:0.01 FR:12 -> RMSE:0.1539 STD:0.1348 
31-Methods:most_var-30% ## MaxLR:0.01 FR:31 -> RMSE:0.1546 STD:0.1473 
37-Methods:most_var-40% ## MaxLR:0.025 FR:17 -> RMSE:0.1547 STD:0.1369 
25-Methods:most_var-30% ## MaxLR:0.025 FR:17 -> RMSE:0.1569 STD:0.1596 
 9-Methods:most_var-10% ## MaxLR:0.004 FR:17 -> RMSE:0.1578 STD:0.1344 
Training under params:
       device -> cpu
        fsize -> 31
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
[E180 time=4.99s lrate=0.00012500 loss=-69.64 var=2.23 score=67.41 best=68.31 30/30 100.00% 0:02:32+0:00:00]    
model fitting, elapsed time: 1:12:38
Number of edges removed: 163/1770 = 9.21%
MixMG number of components: 10
Ours train logmass: p25 48.778999 median 75.203678 p75 95.126321 avg 70.043617
Ours test  logmass: p25 52.151318 median 72.313816 p75 94.234321 avg 67.913312
Ours logmass computation, elapsed time: 0:00:01
Ours predict, elapsed time: 0:00:34
Ours predict, elapsed time: 0:00:41
Ours predict, elapsed time: 0:00:40
Ours predict, elapsed time: 0:00:43
Ours predict, elapsed time: 0:00:48
Ours predict, elapsed time: 0:00:52
Ours predict, elapsed time: 0:00:43
Ours predict, elapsed time: 0:00:52
Ours predict, elapsed time: 0:00:51
-- Setting 0 -- Ours:0.07230331205579663
-- Setting 1 -- Ours:0.08659512278538724
-- Setting 2 -- Ours:0.09669341249565272
-- Setting 3 -- Ours:0.09970672556807614
-- Setting 4 -- Ours:0.09761406765786834
-- Setting 5 -- Ours:0.12099057357853937
-- Setting 6 -- Ours:0.09610589192470026
-- Setting 7 -- Ours:0.1359072883346773
-- Setting 8 -- Ours:0.15475045294376166

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.07230331205579663

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.08659512278538724

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.09669341249565272

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.09970672556807614

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.09761406765786834

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.12099057357853937

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.09610589192470026

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.1359072883346773

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.15475045294376166
All done, elapsed time: 1:19:27
