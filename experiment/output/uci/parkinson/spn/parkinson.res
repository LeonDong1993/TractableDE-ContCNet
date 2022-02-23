python -u main.py configs/uci/parkinson.ini -dir ./results/uci/parkinson/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/parkinson/spn/parkinson.res
Experiment Configuration:
       name -> parkinson
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/parkinson/parkinsons_updrs.data
loader_name -> parkinson
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
        dir -> ./results/uci/parkinson/spn
Loading parkinson data .....
Raw data size:(5875, 15)
Data preparation, elapsed time: 0:00:00
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 -11.496468 median -7.589957 p75 -4.517090 avg -8.522311
spnflow test  logmass: p25 -12.718261 median -8.275415 p75 -5.303621 avg -9.705956
spnflow logmass computation, elapsed time: 0:00:01
spnflow predict, elapsed time: 0:00:04
spnflow predict, elapsed time: 0:00:04
spnflow predict, elapsed time: 0:00:04
spnflow predict, elapsed time: 0:00:04
spnflow predict, elapsed time: 0:00:04
spnflow predict, elapsed time: 0:00:04
spnflow predict, elapsed time: 0:00:04
spnflow predict, elapsed time: 0:00:04
spnflow predict, elapsed time: 0:00:04
-- Setting 0 -- spnflow:0.3899237625980372
-- Setting 1 -- spnflow:0.441979108699019
-- Setting 2 -- spnflow:0.434951923057689
-- Setting 3 -- spnflow:0.43893930451494556
-- Setting 4 -- spnflow:0.45913830130307043
-- Setting 5 -- spnflow:0.4499489104402785
-- Setting 6 -- spnflow:0.49109024998404904
-- Setting 7 -- spnflow:0.528893882181205
-- Setting 8 -- spnflow:0.557434684291306

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.3899237625980372

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.441979108699019

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.434951923057689

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.43893930451494556

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.45913830130307043

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.4499489104402785

Setting 7 -- Query:0.3 Missing:0.1
spnflow 0.49109024998404904

Setting 8 -- Query:0.3 Missing:0.2
spnflow 0.528893882181205

Setting 9 -- Query:0.3 Missing:0.3
spnflow 0.557434684291306
All done, elapsed time: 0:00:41
