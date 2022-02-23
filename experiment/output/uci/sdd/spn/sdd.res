python -u main.py configs/uci/sdd.ini -dir ./results/uci/sdd/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/sdd/spn/sdd.res
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
        dir -> ./results/uci/sdd/spn
Loading Sensorless_drive_diagnosis data .....
Raw data size:(58509, 29)
Data preparation, elapsed time: 0:00:01
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 12.294689 median 17.939613 p75 24.067673 avg 18.855843
spnflow test  logmass: p25 12.100115 median 17.043197 p75 23.833355 avg 18.525616
spnflow logmass computation, elapsed time: 0:02:27
spnflow predict, elapsed time: 0:01:49
spnflow predict, elapsed time: 0:01:37
spnflow predict, elapsed time: 0:01:26
spnflow predict, elapsed time: 0:01:46
spnflow predict, elapsed time: 0:01:35
spnflow predict, elapsed time: 0:01:21
spnflow predict, elapsed time: 0:01:42
spnflow predict, elapsed time: 0:01:31
spnflow predict, elapsed time: 0:01:20
-- Setting 0 -- spnflow:0.34687720866335886
-- Setting 1 -- spnflow:0.324498072685925
-- Setting 2 -- spnflow:0.39959529338114175
-- Setting 3 -- spnflow:0.4071729554418283
-- Setting 4 -- spnflow:0.4224305194656799
-- Setting 5 -- spnflow:0.469754273129356
-- Setting 6 -- spnflow:0.4945764528962113
-- Setting 7 -- spnflow:0.5109775938683255
-- Setting 8 -- spnflow:0.5104985470452363

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.34687720866335886

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.324498072685925

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.39959529338114175

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.4071729554418283

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.4224305194656799

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.469754273129356

Setting 7 -- Query:0.3 Missing:0.1
spnflow 0.4945764528962113

Setting 8 -- Query:0.3 Missing:0.2
spnflow 0.5109775938683255

Setting 9 -- Query:0.3 Missing:0.3
spnflow 0.5104985470452363
All done, elapsed time: 0:16:39
