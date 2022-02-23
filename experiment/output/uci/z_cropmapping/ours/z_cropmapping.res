python -u main.py configs/uci/z_cropmapping.ini -dir ./output/crop_09-2 -kv "models <- ['ours']; gpuid <- (0,1); gpus <- 12; cpus <- 28" | tee -a ./output/crop_09-2/z_cropmapping.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/cropmapping/data.txt
       name -> cropmapping
loader_name -> cropmapping
     device -> gpu
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
       cpus -> 28
       gpus -> 12
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./output/crop_09-2
Loading crop mapping data .....
Raw data size:(50000, 117)
Data preparation, elapsed time: 0:00:07
Running our model ....
Total number of hyper-params:48
28-Methods:most_var-30% ## MaxLR:0.01 FR:20 -> RMSE:0.2913 STD:0.1876 <- chosen
 6-Methods:most_var-10% ## MaxLR:0.01 FR:35 -> RMSE:0.2914 STD:0.2240
 4-Methods:most_var-10% ## MaxLR:0.01 FR:20 -> RMSE:0.2935 STD:0.2309
 2-Methods:most_var-10% ## MaxLR:0.025 FR:35 -> RMSE:0.2944 STD:0.2166
39-Methods:most_var-40% ## MaxLR:0.025 FR:45 -> RMSE:0.3010 STD:0.1857
 7-Methods:most_var-10% ## MaxLR:0.01 FR:45 -> RMSE:0.3058 STD:0.2975
15-Methods:most_var-20% ## MaxLR:0.025 FR:45 -> RMSE:0.3103 STD:0.2173
36-Methods:most_var-40% ## MaxLR:0.025 FR:20 -> RMSE:0.3651 STD:0.9173
40-Methods:most_var-40% ## MaxLR:0.01 FR:20 -> RMSE:0.9306 STD:8.2394
29-Methods:most_var-30% ## MaxLR:0.01 FR:29 -> RMSE:191418.8426 STD:2700289.9561
38-Methods:most_var-40% ## MaxLR:0.025 FR:35 -> RMSE:14552901.1639 STD:205293929.5436
41-Methods:most_var-40% ## MaxLR:0.01 FR:29 -> RMSE:9170621997.3727 STD:129366677796.9077
42-Methods:most_var-40% ## MaxLR:0.01 FR:35 -> RMSE:18774111374.3449 STD:264841432405.0992
45-Methods:most_var-40% ## MaxLR:0.004 FR:29 -> RMSE:105461474852.5083 STD:1487717181478.9009
26-Methods:most_var-30% ## MaxLR:0.025 FR:35 -> RMSE:440186929123.5189 STD:6209600715761.9941
32-Methods:most_var-30% ## MaxLR:0.004 FR:20 -> RMSE:9391299192846.3945 STD:132480578186048.6875
 1-Methods:most_var-10% ## MaxLR:0.025 FR:29 -> RMSE:28190691414733.6289 STD:397678640871873.0000
44-Methods:most_var-40% ## MaxLR:0.004 FR:20 -> RMSE:615425966358053248.0000 STD:8681651622402158592.0000
 9-Methods:most_var-10% ## MaxLR:0.004 FR:29 -> RMSE:2461703773710319104.0000 STD:34726605195878641664.0000
46-Methods:most_var-40% ## MaxLR:0.004 FR:35 -> RMSE:4923408331640142848.0000 STD:69453221454424825856.0000
47-Methods:most_var-40% ## MaxLR:0.004 FR:45 -> RMSE:20166315177316708253696.0000 STD:284480883889135746547712.0000
24-Methods:most_var-30% ## MaxLR:0.025 FR:20 -> RMSE:645321162536365529759744.0000 STD:9103375261991564382044160.0000
18-Methods:most_var-20% ## MaxLR:0.01 FR:35 -> RMSE:967981282235492734074880.0000 STD:13655056381754543584575488.0000
37-Methods:most_var-40% ## MaxLR:0.025 FR:29 -> RMSE:1290641712050923351572480.0000 STD:18206741876246334318575616.0000
 0-Methods:most_var-10% ## MaxLR:0.025 FR:20 -> RMSE:15487701492568952242438144.0000 STD:218480915887547450554056704.0000
Training under params:
       device -> cuda:0
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
[E180 time=3.36s lrate=0.00012500 loss=-86.01 var=0.86 score=85.15 best=85.72 30/30 100.00% 0:01:34+0:00:00]
model fitting, elapsed time: 4:59:21
Number of edges removed: 328/3240 = 10.12%
MixMG number of components: 10
Ours train logmass: p25 86.605020 median 107.792816 p75 120.765260 avg 98.755040
Ours test  logmass: p25 88.227531 median 109.834279 p75 120.473524 avg 97.908358
Ours logmass computation, elapsed time: 0:00:04
Ours predict, elapsed time: 0:01:41
Ours predict, elapsed time: 0:01:52
Ours predict, elapsed time: 0:02:16
Ours predict, elapsed time: 0:01:56
Ours predict, elapsed time: 0:02:12
Ours predict, elapsed time: 0:02:31
Ours predict, elapsed time: 0:02:17
Ours predict, elapsed time: 0:02:30
Ours predict, elapsed time: 0:02:50
-- Setting 0 -- Ours:0.24423888284134315
-- Setting 1 -- Ours:0.2511652615805955
-- Setting 2 -- Ours:0.29057573308312834
-- Setting 3 -- Ours:0.29152516764801367
-- Setting 4 -- Ours:0.2872172652012731
-- Setting 5 -- Ours:0.29608141464497423
-- Setting 6 -- Ours:0.313345480595978
-- Setting 7 -- Ours:0.3079432395475327
-- Setting 8 -- Ours:0.3440027804089336

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.24423888284134315

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.2511652615805955

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.29057573308312834

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.29152516764801367

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.2872172652012731

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.29608141464497423

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.313345480595978

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.3079432395475327

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.3440027804089336
All done, elapsed time: 0:41:11
python -u main.py configs/uci/z_cropmapping.ini -dir ./results/uci/z_cropmapping/ours -kv "models <- ['ours']; gpuid <- (0,1); gpus <- 12; cpus <- 28" | tee -a ./results/uci/z_cropmapping/ours/z_cropmapping.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/cropmapping/data.txt
       name -> cropmapping
loader_name -> cropmapping
     device -> gpu
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
       cpus -> 28
       gpus -> 12
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/uci/z_cropmapping/ours
Loading crop mapping data .....
Raw data size:(50000, 117)
Data preparation, elapsed time: 0:00:07
Running our model ....
Load pretrained ccnet model.
model fitting, elapsed time: 0:00:00
Number of edges removed: 328/3240 = 10.12%
MixMG number of components: 10
Ours train logmass: p25 86.605020 median 107.792816 p75 120.765260 avg 98.755040
Ours test  logmass: p25 88.227531 median 109.834279 p75 120.473524 avg 97.908358
Ours logmass computation, elapsed time: 0:00:04
Ours predict, elapsed time: 0:01:38
Ours predict, elapsed time: 0:01:56
Ours predict, elapsed time: 0:02:19
Ours predict, elapsed time: 0:01:59
Ours predict, elapsed time: 0:02:13
Ours predict, elapsed time: 0:02:32
Ours predict, elapsed time: 0:02:18
Ours predict, elapsed time: 0:02:31
Ours predict, elapsed time: 0:02:51
-- Setting 0 -- Ours:0.24423888284134315
-- Setting 1 -- Ours:0.2511652615805955
-- Setting 2 -- Ours:0.29057573308312834
-- Setting 3 -- Ours:0.29152516764801367
-- Setting 4 -- Ours:0.2872172652012731
-- Setting 5 -- Ours:0.29608141464497423
-- Setting 6 -- Ours:0.313345480595978
-- Setting 7 -- Ours:0.3079432395475327
-- Setting 8 -- Ours:0.3440027804089336

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.24423888284134315

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.2511652615805955

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.29057573308312834

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.29152516764801367

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.2872172652012731

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.29608141464497423

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.313345480595978

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.3079432395475327

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.3440027804089336
All done, elapsed time: 0:20:26
