python -u main.py configs/uci/onlinenews.ini -dir ./output/news-2 -kv "models <- ['ours']; gpuid <- (0,1); gpus <- 12; cpus <- 28; device <- 'gpu'" | tee -a ./output/news-2/onlinenews.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/onlinenews/OnlineNewsPopularity.csv
       name -> online_news
loader_name -> onlinenews
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
        dir -> ./output/news-2
Loading the onlinenews data.....
Raw data size:(39644, 32)
Data preparation, elapsed time: 0:00:04
Running our model ....
Total number of hyper-params:48
26-Methods:most_var-30% ## MaxLR:0.025 FR:23 -> RMSE:0.5189 STD:0.5618 
34-Methods:most_var-30% ## MaxLR:0.004 FR:23 -> RMSE:0.5267 STD:0.5629 
31-Methods:most_var-30% ## MaxLR:0.01 FR:26 -> RMSE:0.5279 STD:0.5586 
29-Methods:most_var-30% ## MaxLR:0.01 FR:22 -> RMSE:0.5288 STD:0.5490 <- chosen
25-Methods:most_var-30% ## MaxLR:0.025 FR:22 -> RMSE:0.5299 STD:0.5540 
27-Methods:most_var-30% ## MaxLR:0.025 FR:26 -> RMSE:0.5317 STD:0.5639 
23-Methods:most_var-20% ## MaxLR:0.004 FR:26 -> RMSE:0.5395 STD:0.5712 
20-Methods:most_var-20% ## MaxLR:0.004 FR:19 -> RMSE:0.5450 STD:0.5663 
30-Methods:most_var-30% ## MaxLR:0.01 FR:23 -> RMSE:0.5456 STD:0.5573 
35-Methods:most_var-30% ## MaxLR:0.004 FR:26 -> RMSE:0.5494 STD:0.5700 
17-Methods:most_var-20% ## MaxLR:0.01 FR:22 -> RMSE:0.5502 STD:0.5637 
16-Methods:most_var-20% ## MaxLR:0.01 FR:19 -> RMSE:0.5505 STD:0.5782 
21-Methods:most_var-20% ## MaxLR:0.004 FR:22 -> RMSE:0.5520 STD:0.5658 
24-Methods:most_var-30% ## MaxLR:0.025 FR:19 -> RMSE:0.5521 STD:0.5786 
22-Methods:most_var-20% ## MaxLR:0.004 FR:23 -> RMSE:0.5530 STD:0.5584 
28-Methods:most_var-30% ## MaxLR:0.01 FR:19 -> RMSE:0.5578 STD:0.5624 
19-Methods:most_var-20% ## MaxLR:0.01 FR:26 -> RMSE:0.5589 STD:0.5785 
32-Methods:most_var-30% ## MaxLR:0.004 FR:19 -> RMSE:0.5604 STD:0.5569 
33-Methods:most_var-30% ## MaxLR:0.004 FR:22 -> RMSE:0.5617 STD:0.5672 
12-Methods:most_var-20% ## MaxLR:0.025 FR:19 -> RMSE:0.5668 STD:0.5952 
18-Methods:most_var-20% ## MaxLR:0.01 FR:23 -> RMSE:0.5708 STD:0.5918 
14-Methods:most_var-20% ## MaxLR:0.025 FR:23 -> RMSE:0.5783 STD:0.7029 
13-Methods:most_var-20% ## MaxLR:0.025 FR:22 -> RMSE:0.5801 STD:0.6522 
 2-Methods:most_var-10% ## MaxLR:0.025 FR:23 -> RMSE:0.5833 STD:0.5742 
 3-Methods:most_var-10% ## MaxLR:0.025 FR:26 -> RMSE:0.5845 STD:0.5820 
Training under params:
       device -> cuda:0
        fsize -> 22
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
[E180 time=1.30s lrate=0.00005000 loss=6.45 var=0.33 score=-6.78 best=-6.62 30/30 100.00% 0:00:40+0:00:00]    
model fitting, elapsed time: 0:32:07
Number of edges removed: 111/210 = 52.86%
MixMG number of components: 9
Ours train logmass: p25 -2.093870 median 5.225468 p75 16.380679 avg 4.414545
Ours test  logmass: p25 -5.919853 median 4.803031 p75 17.759708 avg -32.273544
Ours logmass computation, elapsed time: 0:00:00
Ours predict, elapsed time: 0:00:17
Ours predict, elapsed time: 0:00:22
Ours predict, elapsed time: 0:00:27
Ours predict, elapsed time: 0:00:22
Ours predict, elapsed time: 0:00:25
Ours predict, elapsed time: 0:00:30
Ours predict, elapsed time: 0:00:27
Ours predict, elapsed time: 0:00:29
Ours predict, elapsed time: 0:00:35
-- Setting 0 -- Ours:0.32960569842408466
-- Setting 1 -- Ours:0.47827281077634154
-- Setting 2 -- Ours:0.46319349446509933
-- Setting 3 -- Ours:0.45217619266115966
-- Setting 4 -- Ours:0.5770436899231486
-- Setting 5 -- Ours:0.6002691363902367
-- Setting 6 -- Ours:0.4982791844948543
-- Setting 7 -- Ours:0.5841789896104028
-- Setting 8 -- Ours:0.7082004777075448

Setting 1 -- Query:0.1 Missing:0.1
Ours 0.32960569842408466

Setting 2 -- Query:0.1 Missing:0.2
Ours 0.47827281077634154

Setting 3 -- Query:0.1 Missing:0.3
Ours 0.46319349446509933

Setting 4 -- Query:0.2 Missing:0.1
Ours 0.45217619266115966

Setting 5 -- Query:0.2 Missing:0.2
Ours 0.5770436899231486

Setting 6 -- Query:0.2 Missing:0.3
Ours 0.6002691363902367

Setting 7 -- Query:0.3 Missing:0.1
Ours 0.4982791844948543

Setting 8 -- Query:0.3 Missing:0.2
Ours 0.5841789896104028

Setting 9 -- Query:0.3 Missing:0.3
Ours 0.7082004777075448
All done, elapsed time: 0:36:07
