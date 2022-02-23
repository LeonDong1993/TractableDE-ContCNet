python -u main.py configs/uci/sdd.ini -dir ./output/sdd05-oct -kv "models <-['rnade']; cpus <- 24" | tee -a ./output/sdd05-oct/sdd.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
     models -> ['rnade']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 24
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./output/sdd05-oct
Loading Sensorless_drive_diagnosis data .....
Raw data size:(58509, 29)
Data preparation, elapsed time: 0:00:01
Run RNADE ....
Size of hyper-params: 48
Param:(20, 0.001, 0.005) -> RMSE:0.9163681146327608
Param:(20, 0.01, 0.00125) -> RMSE:0.9725757891499791
Param:(20, 0.1, 0.00125) -> RMSE:0.9867202750507319
Param:(20, 0.001, 0.00125) -> RMSE:1.0150813920587927
Param:(20, 0, 0.00125) -> RMSE:1.0330149948784586
Param:(10, 0.01, 0.00125) -> RMSE:1.1475245988652432
Param:(20, 0.001, 0.0025) -> RMSE:1.5936767430851881
Param:(2, 0.1, 0.005) -> RMSE:inf
Param:(2, 0.1, 0.0025) -> RMSE:inf
Param:(2, 0.1, 0.00125) -> RMSE:inf
Param:(2, 0.01, 0.005) -> RMSE:inf
Param:(2, 0.01, 0.0025) -> RMSE:inf
Param:(2, 0.01, 0.00125) -> RMSE:inf
Param:(2, 0.001, 0.005) -> RMSE:inf
Param:(2, 0.001, 0.0025) -> RMSE:inf
#comps:20 weight decay:0.001 lrate:0.005
RNADE fit, elapsed time: 1:42:29
RNADE train logmass: p25 -0.754688 median 5.281721 p75 10.895211 avg 4.972792
RNADE test  logmass: p25 0.752769 median 6.486211 p75 11.563599 avg 6.214869
RNADE logmass computation, elapsed time: 0:00:14
S0, RNADE pred logmass: p25 4.280601 median 9.632461 p75 15.389836 avg 9.860473
RNADE predict, elapsed time: 0:00:30
S1, RNADE pred logmass: p25 5.368835 median 10.207397 p75 15.554573 avg 10.972163
RNADE predict, elapsed time: 0:00:33
S2, RNADE pred logmass: p25 6.501939 median 11.651538 p75 15.869098 avg 11.730274
RNADE predict, elapsed time: 0:00:27
S3, RNADE pred logmass: p25 5.695092 median 10.777558 p75 16.028988 avg 11.152291
RNADE predict, elapsed time: 0:00:34
S4, RNADE pred logmass: p25 7.034524 median 11.525648 p75 16.318484 avg 12.065891
RNADE predict, elapsed time: 0:00:33
S5, RNADE pred logmass: p25 6.566834 median 11.947968 p75 16.720053 avg 12.503992
RNADE predict, elapsed time: 0:00:31
S6, RNADE pred logmass: p25 6.315407 median 11.835904 p75 16.513241 avg 11.948851
RNADE predict, elapsed time: 0:00:29
S7, RNADE pred logmass: p25 6.897099 median 12.014871 p75 16.497957 avg 12.148002
RNADE predict, elapsed time: 0:00:28
S8, RNADE pred logmass: p25 7.703461 median 12.043264 p75 16.483497 avg 10.595614
RNADE predict, elapsed time: 0:00:24
-- Setting 0 -- RNADE:0.4616366513762984
-- Setting 1 -- RNADE:0.46571180447857047
-- Setting 2 -- RNADE:0.5345907479101649
-- Setting 3 -- RNADE:0.525517981598228
-- Setting 4 -- RNADE:0.5567748701485461
-- Setting 5 -- RNADE:0.5876273013761778
-- Setting 6 -- RNADE:0.61879440591175
-- Setting 7 -- RNADE:0.6073463119445662
-- Setting 8 -- RNADE:0.9061601019027803

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.4616366513762984

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.46571180447857047

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.5345907479101649

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.525517981598228

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.5567748701485461

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.5876273013761778

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.61879440591175

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.6073463119445662

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.9061601019027803
All done, elapsed time: 1:47:18
python -u main.py configs/uci/sdd.ini -dir ./results/uci/sdd/rnade -kv "models <- ['rnade']; cpus <- 28" | tee -a ./results/uci/sdd/rnade/sdd.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
        dir -> ./results/uci/sdd/rnade
Loading Sensorless_drive_diagnosis data .....
Raw data size:(58509, 29)
Data preparation, elapsed time: 0:00:01
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -0.754688 median 5.281721 p75 10.895211 avg 4.972792
RNADE test  logmass: p25 0.752769 median 6.486211 p75 11.563599 avg 6.214869
RNADE logmass computation, elapsed time: 0:00:14
RNADE predict, elapsed time: 0:00:29
RNADE predict, elapsed time: 0:00:33
RNADE predict, elapsed time: 0:00:27
RNADE predict, elapsed time: 0:00:34
RNADE predict, elapsed time: 0:00:33
RNADE predict, elapsed time: 0:00:31
RNADE predict, elapsed time: 0:00:29
RNADE predict, elapsed time: 0:00:28
RNADE predict, elapsed time: 0:00:23
-- Setting 0 -- RNADE:0.46163665137629833
-- Setting 1 -- RNADE:0.46571180447857047
-- Setting 2 -- RNADE:0.5345907479101653
-- Setting 3 -- RNADE:0.525517981598228
-- Setting 4 -- RNADE:0.5567748701485461
-- Setting 5 -- RNADE:0.5876273013761777
-- Setting 6 -- RNADE:0.6187944059117497
-- Setting 7 -- RNADE:0.6073463119445666
-- Setting 8 -- RNADE:0.9061601019027805

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.46163665137629833

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.46571180447857047

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.5345907479101653

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.525517981598228

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.5567748701485461

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.5876273013761777

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.6187944059117497

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.6073463119445666

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.9061601019027805
All done, elapsed time: 0:04:46
