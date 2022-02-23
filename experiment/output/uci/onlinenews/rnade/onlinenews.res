python -u main.py configs/uci/onlinenews.ini -dir ./results/raw/uci/onlinenews -kv "models <- ['gbn','spnet','rnade', 'ours']" | tee -a ./results/raw/uci/onlinenews/onlinenews.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/onlinenews/OnlineNewsPopularity.csv
       name -> online_news
loader_name -> onlinenews
     device -> cpu
      query -> [0.1, 0.2, 0.3]
    missing -> [0.1, 0.2, 0.3]
      label -> False
     scaler -> StandardScaler()
  transform -> None
  cache_dir -> ./cache
     models -> ['gbn', 'spnet', 'rnade', 'ours']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/raw/uci/onlinenews
Loading the onlinenews data.....
Raw data size:(39644, 32)
Data preparation, elapsed time: 0:00:04
Run RNADE ....
Size of hyper-params: 48
#comps:20 weight decay:0.001 lrate:0.00625
RNADE fit, elapsed time: 1:18:05
RNADE train logmass: p25 -6.405030 median 7.807766 p75 22.022047 avg 7.662639
RNADE test  logmass: p25 -7.491274 median 7.638027 p75 22.737493 avg 6.772032
RNADE logmass computation, elapsed time: 0:00:10
S0, RNADE pred logmass: p25 3.530017 median 14.190554 p75 26.138747 avg 14.170012
RNADE predict, elapsed time: 0:00:22
S1, RNADE pred logmass: p25 7.937382 median 17.983631 p75 29.409226 avg 17.380786
RNADE predict, elapsed time: 0:00:16
S2, RNADE pred logmass: p25 10.783564 median 19.996097 p75 27.828993 avg 18.706553
RNADE predict, elapsed time: 0:00:15
S3, RNADE pred logmass: p25 6.411685 median 18.172496 p75 29.207743 avg 17.128478
RNADE predict, elapsed time: 0:00:20
S4, RNADE pred logmass: p25 9.740898 median 20.325252 p75 28.633067 avg 18.924957
RNADE predict, elapsed time: 0:00:17
S5, RNADE pred logmass: p25 15.877681 median 22.966417 p75 30.557227 avg 22.746331
RNADE predict, elapsed time: 0:00:15
S6, RNADE pred logmass: p25 10.728792 median 20.592095 p75 28.782061 avg 18.817193
RNADE predict, elapsed time: 0:00:16
S7, RNADE pred logmass: p25 13.680777 median 22.366867 p75 30.443469 avg 21.589618
RNADE predict, elapsed time: 0:00:12
S8, RNADE pred logmass: p25 17.064506 median 24.519289 p75 31.424891 avg 24.331877
RNADE predict, elapsed time: 0:00:11
-- Setting 0 -- RNADE:0.6584163935460249
-- Setting 1 -- RNADE:0.768539168234124
-- Setting 2 -- RNADE:0.7979091873620913
-- Setting 3 -- RNADE:0.7835941382483713
-- Setting 4 -- RNADE:0.8592109678524491
-- Setting 5 -- RNADE:0.9461223276291568
-- Setting 6 -- RNADE:0.9009050405362103
-- Setting 7 -- RNADE:0.9516911652782497
-- Setting 8 -- RNADE:1.1029230291689405
python -u main.py configs/uci/onlinenews.ini -dir ./results/uci/onlinenews/rnade -kv "models <- ['rnade']; cpus <- 28" | tee -a ./results/uci/onlinenews/rnade/onlinenews.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/onlinenews/OnlineNewsPopularity.csv
       name -> online_news
loader_name -> onlinenews
     device -> cpu
      query -> [0.1, 0.2, 0.3]
    missing -> [0.1, 0.2, 0.3]
      label -> False
     scaler -> StandardScaler()
  transform -> None
  cache_dir -> ./cache
     models -> ['rnade']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/uci/onlinenews/rnade
Loading the onlinenews data.....
Raw data size:(39644, 32)
Data preparation, elapsed time: 0:00:04
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -6.405030 median 7.807766 p75 22.022047 avg 7.662639
RNADE test  logmass: p25 -7.491274 median 7.638027 p75 22.737493 avg 6.772032
RNADE logmass computation, elapsed time: 0:00:10
RNADE predict, elapsed time: 0:00:23
RNADE predict, elapsed time: 0:00:16
RNADE predict, elapsed time: 0:00:15
RNADE predict, elapsed time: 0:00:20
RNADE predict, elapsed time: 0:00:15
RNADE predict, elapsed time: 0:00:15
RNADE predict, elapsed time: 0:00:15
RNADE predict, elapsed time: 0:00:14
RNADE predict, elapsed time: 0:00:11
-- Setting 0 -- RNADE:0.6703427292982866
-- Setting 1 -- RNADE:0.7594619627360483
-- Setting 2 -- RNADE:0.8478647752887204
-- Setting 3 -- RNADE:0.7921297077590637
-- Setting 4 -- RNADE:0.8427084313802401
-- Setting 5 -- RNADE:0.9256922423080468
-- Setting 6 -- RNADE:0.8969530373765083
-- Setting 7 -- RNADE:0.9820726797861664
-- Setting 8 -- RNADE:0.987814370078675

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.6703427292982866

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.7594619627360483

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.8478647752887204

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.7921297077590637

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.8427084313802401

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.9256922423080468

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.8969530373765083

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.9820726797861664

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.987814370078675
All done, elapsed time: 0:02:38
