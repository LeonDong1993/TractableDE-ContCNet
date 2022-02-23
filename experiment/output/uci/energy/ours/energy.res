python -u main.py configs/uci/energy.ini -dir ./output/uci-09/energy/ours -kv "models <- ['ours']; cpus <- 48" | tee -a ./output/uci-09/energy/ours/energy.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/energy/data.csv
       name -> energy
loader_name -> energy
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
        dir -> ./output/uci-09/energy/ours
Loading the energy data.....
Raw data size:(19735, 24)
Data preparation, elapsed time: 0:00:00
Running our model ....
Total number of hyper-params:48
27-Methods:most_var-30% ## MaxLR:0.025 FR:17 -> RMSE:0.2267 STD:0.2519 
15-Methods:most_var-20% ## MaxLR:0.025 FR:17 -> RMSE:0.2279 STD:0.2182 <- chosen
31-Methods:most_var-30% ## MaxLR:0.01 FR:17 -> RMSE:0.2282 STD:0.2273 
39-Methods:most_var-40% ## MaxLR:0.025 FR:17 -> RMSE:0.2291 STD:0.2308 
26-Methods:most_var-30% ## MaxLR:0.025 FR:13 -> RMSE:0.2468 STD:0.2567 
35-Methods:most_var-30% ## MaxLR:0.004 FR:17 -> RMSE:0.2531 STD:0.2441 
14-Methods:most_var-20% ## MaxLR:0.025 FR:13 -> RMSE:0.2703 STD:0.2510 
43-Methods:most_var-40% ## MaxLR:0.01 FR:17 -> RMSE:0.2707 STD:0.2532 
30-Methods:most_var-30% ## MaxLR:0.01 FR:13 -> RMSE:0.2709 STD:0.2420 
38-Methods:most_var-40% ## MaxLR:0.025 FR:13 -> RMSE:0.2741 STD:0.2578 
47-Methods:most_var-40% ## MaxLR:0.004 FR:17 -> RMSE:0.2749 STD:0.2670 
19-Methods:most_var-20% ## MaxLR:0.01 FR:17 -> RMSE:0.2753 STD:0.3052 
42-Methods:most_var-40% ## MaxLR:0.01 FR:13 -> RMSE:0.2877 STD:0.2575 
46-Methods:most_var-40% ## MaxLR:0.004 FR:13 -> RMSE:0.2935 STD:0.2679 
34-Methods:most_var-30% ## MaxLR:0.004 FR:13 -> RMSE:0.2938 STD:0.2974 
23-Methods:most_var-20% ## MaxLR:0.004 FR:17 -> RMSE:0.2941 STD:0.2698 
25-Methods:most_var-30% ## MaxLR:0.025 FR:10 -> RMSE:0.2982 STD:0.3534 
18-Methods:most_var-20% ## MaxLR:0.01 FR:13 -> RMSE:0.3005 STD:0.2945 
13-Methods:most_var-20% ## MaxLR:0.025 FR:10 -> RMSE:0.3107 STD:0.2679 
37-Methods:most_var-40% ## MaxLR:0.025 FR:10 -> RMSE:0.3130 STD:0.2921 
29-Methods:most_var-30% ## MaxLR:0.01 FR:10 -> RMSE:0.3140 STD:0.2964 
41-Methods:most_var-40% ## MaxLR:0.01 FR:10 -> RMSE:0.3151 STD:0.2716 
36-Methods:most_var-40% ## MaxLR:0.025 FR:7 -> RMSE:0.3165 STD:0.2619 
45-Methods:most_var-40% ## MaxLR:0.004 FR:10 -> RMSE:0.3277 STD:0.2715 
24-Methods:most_var-30% ## MaxLR:0.025 FR:7 -> RMSE:0.3291 STD:0.2615 
Training under params:
       device -> cpu
        fsize -> 17
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
[E180 time=0.82s lrate=0.00012500 loss=-6.86 var=0.41 score=6.45 best=6.66 30/30 100.00% 0:00:24+0:00:00]    
model fitting, elapsed time: 0:11:18
Number of edges removed: 16/153 = 10.46%
MixMG number of components: 10
Ours train logmass: p25 -2.481583 median 3.660511 p75 9.443850 avg 3.281735
Ours test  logmass: p25 -2.953593 median 3.381446 p75 9.019510 avg 2.785411
Ours logmass computation, elapsed time: 0:00:00
Ours predict, elapsed time: 0:00:09
Ours predict, elapsed time: 0:00:12
Ours predict, elapsed time: 0:00:14
Ours predict, elapsed time: 0:00:09
Ours predict, elapsed time: 0:00:14
Ours predict, elapsed time: 0:00:14
Ours predict, elapsed time: 0:00:13
Ours predict, elapsed time: 0:00:13
Ours predict, elapsed time: 0:00:16
-- Setting 0 -- Ours:0.1315752710324477
-- Setting 1 -- Ours:0.1971967675565493
-- Setting 2 -- Ours:0.1889120736347879
-- Setting 3 -- Ours:0.20814989023277852
-- Setting 4 -- Ours:0.2726824132434046
-- Setting 5 -- Ours:0.27489604583097654
-- Setting 6 -- Ours:0.24702496446519454
-- Setting 7 -- Ours:0.29370045660412947
-- Setting 8 -- Ours:0.3494945992133791

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.1315752710324477

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.1971967675565493

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.1889120736347879

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.20814989023277852

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.2726824132434046

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.27489604583097654

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.24702496446519454

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.29370045660412947

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.3494945992133791
All done, elapsed time: 0:13:17
