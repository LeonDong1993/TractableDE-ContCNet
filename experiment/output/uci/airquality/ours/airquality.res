python -u main.py configs/uci/airquality.ini -dir ./output/uci-09/airquality/ours -kv "models <- ['ours']; cpus <- 48" | tee -a ./output/uci-09/airquality/ours/airquality.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/airquality/AirQualityUCI.csv
       name -> airquality
loader_name -> airquality
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
        dir -> ./output/uci-09/airquality/ours
Loading air quality data .....
Raw data size:(9357, 12)
Data preparation, elapsed time: 0:00:00
Running our model ....
Total number of hyper-params:48
27-Methods:most_var-30% ## MaxLR:0.025 FR:9 -> RMSE:0.2094 STD:0.3893 <- chosen
35-Methods:most_var-30% ## MaxLR:0.004 FR:9 -> RMSE:0.2124 STD:0.3979 
31-Methods:most_var-30% ## MaxLR:0.01 FR:9 -> RMSE:0.2128 STD:0.3904 
30-Methods:most_var-30% ## MaxLR:0.01 FR:7 -> RMSE:0.2134 STD:0.3891 
26-Methods:most_var-30% ## MaxLR:0.025 FR:7 -> RMSE:0.2159 STD:0.3877 
39-Methods:most_var-40% ## MaxLR:0.025 FR:9 -> RMSE:0.2187 STD:0.4180 
24-Methods:most_var-30% ## MaxLR:0.025 FR:4 -> RMSE:0.2210 STD:0.3961 
25-Methods:most_var-30% ## MaxLR:0.025 FR:6 -> RMSE:0.2226 STD:0.3946 
34-Methods:most_var-30% ## MaxLR:0.004 FR:7 -> RMSE:0.2233 STD:0.3869 
28-Methods:most_var-30% ## MaxLR:0.01 FR:4 -> RMSE:0.2246 STD:0.3930 
43-Methods:most_var-40% ## MaxLR:0.01 FR:9 -> RMSE:0.2250 STD:0.4191 
29-Methods:most_var-30% ## MaxLR:0.01 FR:6 -> RMSE:0.2252 STD:0.3963 
33-Methods:most_var-30% ## MaxLR:0.004 FR:6 -> RMSE:0.2253 STD:0.3945 
38-Methods:most_var-40% ## MaxLR:0.025 FR:7 -> RMSE:0.2301 STD:0.4168 
46-Methods:most_var-40% ## MaxLR:0.004 FR:7 -> RMSE:0.2361 STD:0.4211 
41-Methods:most_var-40% ## MaxLR:0.01 FR:6 -> RMSE:0.2415 STD:0.4326 
45-Methods:most_var-40% ## MaxLR:0.004 FR:6 -> RMSE:0.2417 STD:0.4346 
36-Methods:most_var-40% ## MaxLR:0.025 FR:4 -> RMSE:0.2431 STD:0.4360 
32-Methods:most_var-30% ## MaxLR:0.004 FR:4 -> RMSE:0.2474 STD:0.4103 
37-Methods:most_var-40% ## MaxLR:0.025 FR:6 -> RMSE:0.2499 STD:0.4336 
42-Methods:most_var-40% ## MaxLR:0.01 FR:7 -> RMSE:0.2514 STD:0.4737 
44-Methods:most_var-40% ## MaxLR:0.004 FR:4 -> RMSE:0.2523 STD:0.4363 
47-Methods:most_var-40% ## MaxLR:0.004 FR:9 -> RMSE:0.2551 STD:0.4689 
40-Methods:most_var-40% ## MaxLR:0.01 FR:4 -> RMSE:0.2603 STD:0.4491 
 3-Methods:most_var-10% ## MaxLR:0.025 FR:9 -> RMSE:0.2612 STD:0.3972 
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
[E180 time=0.29s lrate=0.00012500 loss=-5.43 var=0.12 score=5.31 best=5.40 30/30 100.00% 0:00:09+0:00:00]    
model fitting, elapsed time: 0:05:46
Number of edges removed: 1/21 = 4.76%
MixMG number of components: 10
Ours train logmass: p25 10.151845 median 13.056594 p75 15.640795 avg 12.757364
Ours test  logmass: p25 10.481158 median 13.022424 p75 15.499871 avg 12.742604
Ours logmass computation, elapsed time: 0:00:00
Ours predict, elapsed time: 0:00:05
Ours predict, elapsed time: 0:00:07
Ours predict, elapsed time: 0:00:07
Ours predict, elapsed time: 0:00:06
Ours predict, elapsed time: 0:00:07
Ours predict, elapsed time: 0:00:09
Ours predict, elapsed time: 0:00:08
Ours predict, elapsed time: 0:00:08
Ours predict, elapsed time: 0:00:10
-- Setting 0 -- Ours:0.14505024507507536
-- Setting 1 -- Ours:0.1567017436998681
-- Setting 2 -- Ours:0.23132396282327425
-- Setting 3 -- Ours:0.1897557035632562
-- Setting 4 -- Ours:0.25563092436054646
-- Setting 5 -- Ours:0.28113287196084846
-- Setting 6 -- Ours:0.35589298300494404
-- Setting 7 -- Ours:0.34715925674909187
-- Setting 8 -- Ours:0.5033908483178624

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.14505024507507536

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.1567017436998681

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.23132396282327425

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.1897557035632562

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.25563092436054646

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.28113287196084846

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.35589298300494404

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.34715925674909187

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.5033908483178624
All done, elapsed time: 0:06:59
