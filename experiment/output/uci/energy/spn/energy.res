python -u main.py configs/uci/energy.ini -dir ./results/uci/energy/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/energy/spn/energy.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/energy/data.csv
       name -> energy
loader_name -> energy
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
        dir -> ./results/uci/energy/spn
Loading the energy data.....
Raw data size:(19735, 24)
Data preparation, elapsed time: 0:00:00
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 -0.160041 median 9.640605 p75 20.264408 avg 11.080277
spnflow test  logmass: p25 -2.745350 median 8.028037 p75 18.648308 avg 8.657162
spnflow logmass computation, elapsed time: 0:00:18
spnflow predict, elapsed time: 0:00:32
spnflow predict, elapsed time: 0:00:28
spnflow predict, elapsed time: 0:00:26
spnflow predict, elapsed time: 0:00:31
spnflow predict, elapsed time: 0:00:27
spnflow predict, elapsed time: 0:00:25
spnflow predict, elapsed time: 0:00:30
spnflow predict, elapsed time: 0:00:26
spnflow predict, elapsed time: 0:00:24
-- Setting 0 -- spnflow:0.1926274888166385
-- Setting 1 -- spnflow:0.1921149315341619
-- Setting 2 -- spnflow:0.19598622739673593
-- Setting 3 -- spnflow:0.20466530312077544
-- Setting 4 -- spnflow:0.20818942810270513
-- Setting 5 -- spnflow:0.21192367112756197
-- Setting 6 -- spnflow:0.2297796581321333
-- Setting 7 -- spnflow:0.24154993647871417
-- Setting 8 -- spnflow:0.2384306348096578

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.1926274888166385

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.1921149315341619

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.19598622739673593

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.20466530312077544

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.20818942810270513

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.21192367112756197

Setting 7 -- Query:0.3 Missing:0.1
spnflow 0.2297796581321333

Setting 8 -- Query:0.3 Missing:0.2
spnflow 0.24154993647871417

Setting 9 -- Query:0.3 Missing:0.3
spnflow 0.2384306348096578
All done, elapsed time: 0:04:33
