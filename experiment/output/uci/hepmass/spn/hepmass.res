python -u main.py configs/uci/hepmass.ini -dir ./results/uci/hepmass/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/hepmass/spn/hepmass.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/hepmass/hepmass.h5
       name -> hepmass
loader_name -> hepmass
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
        dir -> ./results/uci/hepmass/spn
Loading hepmass data .....
Raw data size:(150000, 21)
Data preparation, elapsed time: 0:00:00
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 -27.834408 median -24.560199 p75 -21.704748 avg -25.029415
spnflow test  logmass: p25 -28.565684 median -25.425159 p75 -22.649111 avg -25.801014
spnflow logmass computation, elapsed time: 0:00:21
spnflow predict, elapsed time: 0:00:06
spnflow predict, elapsed time: 0:00:05
spnflow predict, elapsed time: 0:00:05
spnflow predict, elapsed time: 0:00:06
spnflow predict, elapsed time: 0:00:05
spnflow predict, elapsed time: 0:00:05
spnflow predict, elapsed time: 0:00:06
spnflow predict, elapsed time: 0:00:05
spnflow predict, elapsed time: 0:00:04
-- Setting 0 -- spnflow:0.9039512025080586
-- Setting 1 -- spnflow:0.878688334604228
-- Setting 2 -- spnflow:0.8435714219010694
-- Setting 3 -- spnflow:0.945845975139122
-- Setting 4 -- spnflow:0.9862384890134944
-- Setting 5 -- spnflow:0.9483107466036296
-- Setting 6 -- spnflow:1.0020217328724725
-- Setting 7 -- spnflow:1.0287723255941708
-- Setting 8 -- spnflow:1.0419492356793565

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.9039512025080586

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.878688334604228

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.8435714219010694

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.945845975139122

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.9862384890134944

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.9483107466036296

Setting 7 -- Query:0.3 Missing:0.1
spnflow 1.0020217328724725

Setting 8 -- Query:0.3 Missing:0.2
spnflow 1.0287723255941708

Setting 9 -- Query:0.3 Missing:0.3
spnflow 1.0419492356793565
All done, elapsed time: 0:01:12
