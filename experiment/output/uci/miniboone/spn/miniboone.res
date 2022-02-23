python -u main.py configs/uci/miniboone.ini -dir ./results/uci/miniboone/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/miniboone/spn/miniboone.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/miniboone/miniboone.h5
       name -> miniboone
loader_name -> miniboone
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
        dir -> ./results/uci/miniboone/spn
Loading miniboone data .....
Raw data size:(36488, 43)
Data preparation, elapsed time: 0:00:00
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 -33.741859 median -25.496472 p75 -17.946853 avg -26.771536
spnflow test  logmass: p25 -35.308758 median -27.160453 p75 -21.173637 avg -30.026032
spnflow logmass computation, elapsed time: 0:01:41
spnflow predict, elapsed time: 0:01:36
spnflow predict, elapsed time: 0:01:25
spnflow predict, elapsed time: 0:01:15
spnflow predict, elapsed time: 0:01:34
spnflow predict, elapsed time: 0:01:21
spnflow predict, elapsed time: 0:01:13
spnflow predict, elapsed time: 0:01:31
spnflow predict, elapsed time: 0:01:20
spnflow predict, elapsed time: 0:01:11
-- Setting 0 -- spnflow:0.4980164616626223
-- Setting 1 -- spnflow:0.5209210195712619
-- Setting 2 -- spnflow:0.5530111321788839
-- Setting 3 -- spnflow:0.5246779716504542
-- Setting 4 -- spnflow:0.5492571761884689
-- Setting 5 -- spnflow:0.552633155262667
-- Setting 6 -- spnflow:0.5524394114568925
-- Setting 7 -- spnflow:0.5577581784480735
-- Setting 8 -- spnflow:0.573543430037746

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.4980164616626223

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.5209210195712619

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.5530111321788839

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.5246779716504542

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.5492571761884689

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.552633155262667

Setting 7 -- Query:0.3 Missing:0.1
spnflow 0.5524394114568925

Setting 8 -- Query:0.3 Missing:0.2
spnflow 0.5577581784480735

Setting 9 -- Query:0.3 Missing:0.3
spnflow 0.573543430037746
All done, elapsed time: 0:14:13
