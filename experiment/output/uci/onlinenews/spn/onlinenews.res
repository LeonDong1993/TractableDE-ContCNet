python -u main.py configs/uci/onlinenews.ini -dir ./results/uci/onlinenews/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/onlinenews/spn/onlinenews.res
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
     models -> ['spnet']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/uci/onlinenews/spn
Loading the onlinenews data.....
Raw data size:(39644, 32)
Data preparation, elapsed time: 0:00:04
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 46.497433 median 68.918519 p75 90.043960 avg 70.775140
spnflow test  logmass: p25 43.722638 median 67.025924 p75 88.438874 avg 64.881983
spnflow logmass computation, elapsed time: 0:01:08
spnflow predict, elapsed time: 0:01:09
spnflow predict, elapsed time: 0:01:03
spnflow predict, elapsed time: 0:00:55
spnflow predict, elapsed time: 0:01:07
spnflow predict, elapsed time: 0:01:01
spnflow predict, elapsed time: 0:00:52
spnflow predict, elapsed time: 0:01:04
spnflow predict, elapsed time: 0:00:59
spnflow predict, elapsed time: 0:00:51
-- Setting 0 -- spnflow:0.4518397024128306
-- Setting 1 -- spnflow:0.5162104676340938
-- Setting 2 -- spnflow:0.5869566388775023
-- Setting 3 -- spnflow:0.5648687031183591
-- Setting 4 -- spnflow:0.6190320645144513
-- Setting 5 -- spnflow:0.705321119042309
-- Setting 6 -- spnflow:0.5814165814525388
-- Setting 7 -- spnflow:0.7107525498500488
-- Setting 8 -- spnflow:0.8256541232992946

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.4518397024128306

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.5162104676340938

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.5869566388775023

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.5648687031183591

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.6190320645144513

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.705321119042309

Setting 7 -- Query:0.3 Missing:0.1
spnflow 0.5814165814525388

Setting 8 -- Query:0.3 Missing:0.2
spnflow 0.7107525498500488

Setting 9 -- Query:0.3 Missing:0.3
spnflow 0.8256541232992946
All done, elapsed time: 0:10:14
