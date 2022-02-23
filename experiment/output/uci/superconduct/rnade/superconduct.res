python -u main.py configs/uci/superconduct.ini -dir ./results/raw/uci/superconduct -kv "models <- ['rnade']" | tee -a ./results/raw/uci/superconduct/superconduct.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
        dir -> ./results/raw/uci/superconduct
Loading the superconduct data.....
Raw data size:(21263, 68)
Data preparation, elapsed time: 0:00:03
Run RNADE ....
Size of hyper-params: 48
#comps:5 weight decay:0.01 lrate:0.00625
RNADE fit, elapsed time: 3:27:07
RNADE train logmass: p25 -19.471590 median 17.145770 p75 78.771019 avg 30.414506
RNADE test  logmass: p25 -21.278091 median 9.897951 p75 78.350104 avg 26.918000
RNADE logmass computation, elapsed time: 0:00:09
S0, RNADE pred logmass: p25 -12.676398 median 16.862478 p75 86.682180 avg 34.664385
RNADE predict, elapsed time: 0:01:57
S1, RNADE pred logmass: p25 -9.653303 median 20.097783 p75 86.607034 avg 37.648922
RNADE predict, elapsed time: 0:02:50
S2, RNADE pred logmass: p25 -8.040420 median 22.469747 p75 88.372214 avg 39.930751
RNADE predict, elapsed time: 0:03:31
S3, RNADE pred logmass: p25 -10.492898 median 20.716126 p75 86.700100 avg 37.463001
RNADE predict, elapsed time: 0:02:51
S4, RNADE pred logmass: p25 -7.961223 median 27.919980 p75 85.949717 avg 39.620935
RNADE predict, elapsed time: 0:03:34
S5, RNADE pred logmass: p25 -5.318527 median 27.858363 p75 87.200139 avg 40.606398
RNADE predict, elapsed time: 0:04:15
S6, RNADE pred logmass: p25 -7.559689 median 21.244269 p75 89.857628 avg 39.614360
RNADE predict, elapsed time: 0:03:32
S7, RNADE pred logmass: p25 -5.221918 median 24.831478 p75 92.720936 avg 41.428529
RNADE predict, elapsed time: 0:04:24
S8, RNADE pred logmass: p25 -2.943357 median 30.292596 p75 87.544689 avg 41.668686
RNADE predict, elapsed time: 0:04:52
-- Setting 0 -- RNADE:0.27983701514288517
-- Setting 1 -- RNADE:0.31696609957172556
-- Setting 2 -- RNADE:0.30000550487741967
-- Setting 3 -- RNADE:0.32750965857232184
-- Setting 4 -- RNADE:0.3173577250928824
-- Setting 5 -- RNADE:0.3577826668249574
-- Setting 6 -- RNADE:0.32868132298247443
-- Setting 7 -- RNADE:0.3723995794909395
-- Setting 8 -- RNADE:0.3991921806540346

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.27983701514288517

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.31696609957172556

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.30000550487741967

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.32750965857232184

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.3173577250928824

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.3577826668249574

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.32868132298247443

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.3723995794909395

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.3991921806540346
All done, elapsed time: 3:59:07
python -u main.py configs/uci/superconduct.ini -dir ./results/uci/superconduct/rnade -kv "models <- ['rnade']; cpus <- 28" | tee -a ./results/uci/superconduct/rnade/superconduct.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
        dir -> ./results/uci/superconduct/rnade
Loading the superconduct data.....
Raw data size:(21263, 68)
Data preparation, elapsed time: 0:00:02
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -19.471590 median 17.145770 p75 78.771019 avg 30.414506
RNADE test  logmass: p25 -21.278091 median 9.897951 p75 78.350104 avg 26.918000
RNADE logmass computation, elapsed time: 0:00:09
RNADE predict, elapsed time: 0:01:58
RNADE predict, elapsed time: 0:02:52
RNADE predict, elapsed time: 0:03:31
RNADE predict, elapsed time: 0:02:49
RNADE predict, elapsed time: 0:03:37
RNADE predict, elapsed time: 0:04:17
RNADE predict, elapsed time: 0:03:37
RNADE predict, elapsed time: 0:04:24
RNADE predict, elapsed time: 0:05:00
-- Setting 0 -- RNADE:0.26601976318906745
-- Setting 1 -- RNADE:0.33877870134866866
-- Setting 2 -- RNADE:0.30610274097180357
-- Setting 3 -- RNADE:0.3309940253653024
-- Setting 4 -- RNADE:0.326728809970826
-- Setting 5 -- RNADE:0.34035862868194916
-- Setting 6 -- RNADE:0.33045329706005405
-- Setting 7 -- RNADE:0.3621125847405516
-- Setting 8 -- RNADE:0.39648914173519

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.26601976318906745

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.33877870134866866

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.30610274097180357

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.3309940253653024

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.326728809970826

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.34035862868194916

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.33045329706005405

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.3621125847405516

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.39648914173519
All done, elapsed time: 0:32:17
