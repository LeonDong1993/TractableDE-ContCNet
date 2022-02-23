python -u main.py configs/uci/airquality.ini -dir ./results/uci/airquality/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/airquality/spn/airquality.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
        dir -> ./results/uci/airquality/spn
Loading air quality data .....
Raw data size:(9357, 12)
Data preparation, elapsed time: 0:00:00
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 18.002497 median 21.429398 p75 26.188725 avg 29.021973
spnflow test  logmass: p25 17.301769 median 20.779297 p75 26.664592 avg 29.681836
spnflow logmass computation, elapsed time: 0:00:02
spnflow predict, elapsed time: 0:00:06
spnflow predict, elapsed time: 0:00:06
spnflow predict, elapsed time: 0:00:05
spnflow predict, elapsed time: 0:00:06
spnflow predict, elapsed time: 0:00:06
spnflow predict, elapsed time: 0:00:04
spnflow predict, elapsed time: 0:00:06
spnflow predict, elapsed time: 0:00:05
spnflow predict, elapsed time: 0:00:04
-- Setting 0 -- spnflow:0.1526713119218967
-- Setting 1 -- spnflow:0.16457268135319453
-- Setting 2 -- spnflow:0.22012746797405217
-- Setting 3 -- spnflow:0.19202673628213549
-- Setting 4 -- spnflow:0.2535145446742099
-- Setting 5 -- spnflow:0.2654662499816473
-- Setting 6 -- spnflow:0.2717031532053595
-- Setting 7 -- spnflow:0.29645650681578745
-- Setting 8 -- spnflow:0.41840741244929075

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.1526713119218967

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.16457268135319453

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.22012746797405217

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.19202673628213549

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.2535145446742099

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.2654662499816473

Setting 7 -- Query:0.3 Missing:0.1
spnflow 0.2717031532053595

Setting 8 -- Query:0.3 Missing:0.2
spnflow 0.29645650681578745

Setting 9 -- Query:0.3 Missing:0.3
spnflow 0.41840741244929075
All done, elapsed time: 0:00:53
