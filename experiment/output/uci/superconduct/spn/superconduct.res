python -u main.py configs/uci/superconduct.ini -dir ./results/uci/superconduct/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/superconduct/spn/superconduct.res
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
        dir -> ./results/uci/superconduct/spn
Loading the superconduct data.....
Raw data size:(21263, 68)
Data preparation, elapsed time: 0:00:02
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 2.357257 median 84.810783 p75 256.972967 avg 170.484118
spnflow test  logmass: p25 5.114957 median 96.818013 p75 285.552284 avg 176.615722
spnflow logmass computation, elapsed time: 0:01:05
spnflow predict, elapsed time: 0:01:57
spnflow predict, elapsed time: 0:01:43
spnflow predict, elapsed time: 0:01:34
spnflow predict, elapsed time: 0:01:55
spnflow predict, elapsed time: 0:01:41
spnflow predict, elapsed time: 0:01:30
spnflow predict, elapsed time: 0:01:51
spnflow predict, elapsed time: 0:01:39
spnflow predict, elapsed time: 0:01:28
-- Setting 0 -- spnflow:0.1933461692668908
-- Setting 1 -- spnflow:0.19815758279918833
-- Setting 2 -- spnflow:0.1933030481205669
-- Setting 3 -- spnflow:0.2075225388375516
-- Setting 4 -- spnflow:0.19887001649964425
-- Setting 5 -- spnflow:0.2055514421634398
-- Setting 6 -- spnflow:0.20285401940788325
-- Setting 7 -- spnflow:0.2080348867823755
-- Setting 8 -- spnflow:0.21253284293822375

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.1933461692668908

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.19815758279918833

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.1933030481205669

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.2075225388375516

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.19887001649964425

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.2055514421634398

Setting 7 -- Query:0.3 Missing:0.1
spnflow 0.20285401940788325

Setting 8 -- Query:0.3 Missing:0.2
spnflow 0.2080348867823755

Setting 9 -- Query:0.3 Missing:0.3
spnflow 0.21253284293822375
All done, elapsed time: 0:16:28
