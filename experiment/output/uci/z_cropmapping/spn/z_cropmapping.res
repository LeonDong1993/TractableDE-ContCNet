python -u main.py configs/uci/z_cropmapping.ini -dir ./results/uci/z_cropmapping/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/z_cropmapping/spn/z_cropmapping.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/cropmapping/data.txt
       name -> cropmapping
loader_name -> cropmapping
     device -> gpu
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
        dir -> ./results/uci/z_cropmapping/spn
Loading crop mapping data .....
Raw data size:(50000, 117)
Data preparation, elapsed time: 0:00:07
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:01
spnflow train logmass: p25 15.530053 median 53.421172 p75 92.417077 avg 51.722983
spnflow test  logmass: p25 10.884399 median 50.125554 p75 92.351544 avg 46.458980
spnflow logmass computation, elapsed time: 0:09:50
python -u main.py configs/uci/z_cropmapping.ini -dir ./results/uci/z_cropmapping/spn -kv "models <- ['spnet']; cpus <- 20" | tee -a ./results/uci/z_cropmapping/spn/z_cropmapping.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/cropmapping/data.txt
       name -> cropmapping
loader_name -> cropmapping
     device -> gpu
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
       cpus -> 20
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/uci/z_cropmapping/spn
Loading crop mapping data .....
Raw data size:(50000, 117)
Data preparation, elapsed time: 0:00:07
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:01
python -u main.py configs/uci/z_cropmapping.ini -dir ./output/spn -kv "models <- ['spnet']; cpus <- 30" | tee -a ./output/spn/z_cropmapping.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/cropmapping/data.txt
       name -> cropmapping
loader_name -> cropmapping
     device -> gpu
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
       cpus -> 30
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./output/spn
Loading crop mapping data .....
Raw data size:(50000, 117)
Data preparation, elapsed time: 0:00:07
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:01
spnflow train logmass: p25 15.530053 median 53.421172 p75 92.417077 avg 51.722983
spnflow test  logmass: p25 10.884399 median 50.125554 p75 92.351544 avg 46.458980
spnflow logmass computation, elapsed time: 0:10:14
spnflow predict, elapsed time: 0:05:59
spnflow predict, elapsed time: 0:05:23
spnflow predict, elapsed time: 0:04:45
spnflow predict, elapsed time: 0:05:52
spnflow predict, elapsed time: 0:05:15
spnflow predict, elapsed time: 0:04:43
spnflow predict, elapsed time: 0:05:38
spnflow predict, elapsed time: 0:05:02
spnflow predict, elapsed time: 0:04:33
-- Setting 0 -- spnflow:0.3244801085820319
-- Setting 1 -- spnflow:0.3398869016000347
-- Setting 2 -- spnflow:0.33508016859396633
-- Setting 3 -- spnflow:0.34716306418397475
-- Setting 4 -- spnflow:0.32570883092049163
-- Setting 5 -- spnflow:0.3329922463064616
-- Setting 6 -- spnflow:0.3420275719417688
-- Setting 7 -- spnflow:0.3371767307788691
-- Setting 8 -- spnflow:0.3590459719140627

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.3244801085820319

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.3398869016000347

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.33508016859396633

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.34716306418397475

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.32570883092049163

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.3329922463064616

Setting 7 -- Query:0.3 Missing:0.1
spnflow 0.3420275719417688

Setting 8 -- Query:0.3 Missing:0.2
spnflow 0.3371767307788691

Setting 9 -- Query:0.3 Missing:0.3
spnflow 0.3590459719140627
All done, elapsed time: 0:57:28
