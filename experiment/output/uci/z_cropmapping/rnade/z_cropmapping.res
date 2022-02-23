python -u main.py configs/uci/z_cropmapping.ini -dir ./results/raw/uci/z_cropmapping -kv "models <- ['gbn','spnet','rnade', 'ours']" | tee -a ./results/raw/uci/z_cropmapping/z_cropmapping.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/cropmapping/data.txt
       name -> cropmapping
loader_name -> cropmapping
     device -> cpu
      query -> [0.1, 0.2, 0.3]
    missing -> [0.1, 0.2, 0.3]
      label -> False
     scaler -> StandardScaler()
  transform -> None
  cache_dir -> ./cache
     models -> ['gbn', 'spnet', 'rnade', 'ours']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/raw/uci/z_cropmapping
Loading crop mapping data .....
Raw data size:(50000, 117)
Data preparation, elapsed time: 0:00:07
Run RNADE ....
Size of hyper-params: 48
#comps:2 weight decay:0.1 lrate:0.025
RNADE fit, elapsed time: 1:57:36
RNADE train logmass: p25 -137.542744 median -113.906105 p75 -93.990461 avg -118.888173
RNADE test  logmass: p25 -134.685947 median -112.536473 p75 -91.693968 avg -116.631839
RNADE logmass computation, elapsed time: 0:00:27
S0, RNADE pred logmass: p25 -122.572045 median -103.826087 p75 -83.019891 avg -105.421712
RNADE predict, elapsed time: 0:05:33
S1, RNADE pred logmass: p25 -117.815830 median -101.537687 p75 -82.534008 avg -102.730750
RNADE predict, elapsed time: 0:06:38
S2, RNADE pred logmass: p25 -114.680733 median -97.815029 p75 -82.529857 avg -100.445382
RNADE predict, elapsed time: 0:07:46
S3, RNADE pred logmass: p25 -117.638717 median -100.890875 p75 -82.870178 avg -102.554172
RNADE predict, elapsed time: 0:06:56
S4, RNADE pred logmass: p25 -114.643869 median -98.827336 p75 -80.036454 avg -100.094679
RNADE predict, elapsed time: 0:08:00
S5, RNADE pred logmass: p25 -111.284581 median -95.507203 p75 -81.330635 avg -98.852554
RNADE predict, elapsed time: 0:09:03
S6, RNADE pred logmass: p25 -114.242194 median -97.200902 p75 -80.175173 avg -100.398877
RNADE predict, elapsed time: 0:07:50
S7, RNADE pred logmass: p25 -112.914654 median -96.179207 p75 -83.256333 avg -99.697211
RNADE predict, elapsed time: 0:09:24
S8, RNADE pred logmass: p25 -110.978712 median -93.546153 p75 -83.615828 avg -98.491199
RNADE predict, elapsed time: 0:10:52
-- Setting 0 -- RNADE:0.963578128713368
-- Setting 1 -- RNADE:0.961075884204545
-- Setting 2 -- RNADE:1.0143768395649433
-- Setting 3 -- RNADE:1.0251472929090275
-- Setting 4 -- RNADE:1.0257704275501909
-- Setting 5 -- RNADE:1.031455669549442
-- Setting 6 -- RNADE:1.0503237713723532
-- Setting 7 -- RNADE:1.0915205040599698
-- Setting 8 -- RNADE:1.094911275315832
python -u main.py configs/uci/z_cropmapping.ini -dir ./results/uci/z_cropmapping/rnade -kv "models <- ['rnade']; cpus <- 20" | tee -a ./results/uci/z_cropmapping/rnade/z_cropmapping.res
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
     models -> ['rnade']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 20
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/uci/z_cropmapping/rnade
Loading crop mapping data .....
Raw data size:(50000, 117)
Data preparation, elapsed time: 0:00:07
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -137.542744 median -113.906105 p75 -93.990461 avg -118.888173
RNADE test  logmass: p25 -134.685947 median -112.536473 p75 -91.693968 avg -116.631839
RNADE logmass computation, elapsed time: 0:00:46
RNADE predict, elapsed time: 0:05:11
RNADE predict, elapsed time: 0:06:36
RNADE predict, elapsed time: 0:08:31
RNADE predict, elapsed time: 0:06:58
RNADE predict, elapsed time: 0:08:13
RNADE predict, elapsed time: 0:09:25
RNADE predict, elapsed time: 0:08:11
RNADE predict, elapsed time: 0:09:43
RNADE predict, elapsed time: 0:10:31
-- Setting 0 -- RNADE:0.962042656540211
-- Setting 1 -- RNADE:0.9841286716142341
-- Setting 2 -- RNADE:1.0154097870560794
-- Setting 3 -- RNADE:1.021714621334782
-- Setting 4 -- RNADE:1.0757252873755068
-- Setting 5 -- RNADE:1.0375278754920343
-- Setting 6 -- RNADE:1.060221359858346
-- Setting 7 -- RNADE:1.0806575348544476
-- Setting 8 -- RNADE:1.10239288873536

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.962042656540211

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.9841286716142341

Setting 3 -- Query:0.1 Missing:0.3
RNADE 1.0154097870560794

Setting 4 -- Query:0.2 Missing:0.1
RNADE 1.021714621334782

Setting 5 -- Query:0.2 Missing:0.2
RNADE 1.0757252873755068

Setting 6 -- Query:0.2 Missing:0.3
RNADE 1.0375278754920343

Setting 7 -- Query:0.3 Missing:0.1
RNADE 1.060221359858346

Setting 8 -- Query:0.3 Missing:0.2
RNADE 1.0806575348544476

Setting 9 -- Query:0.3 Missing:0.3
RNADE 1.10239288873536
All done, elapsed time: 1:14:11
