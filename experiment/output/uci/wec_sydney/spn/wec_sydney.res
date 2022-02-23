python -u main.py configs/uci/wec_sydney.ini -dir ./results/uci/wec_sydney/spn -kv "models <- ['spnet']; cpus <- 28" | tee -a ./results/uci/wec_sydney/spn/wec_sydney.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/WEC_sydney/Sydney_Data.csv
       name -> WEC_sydney
loader_name -> WEC_sydney
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
        dir -> ./results/uci/wec_sydney/spn
Loading WEC-Sydney data .....
Raw data size:(72000, 49)
Data preparation, elapsed time: 0:00:02
Run spnflow ....
Load pretrained spn model.
spnflow fit, elapsed time: 0:00:00
spnflow train logmass: p25 -55.959039 median -36.766363 p75 10.531003 avg -18.525174
spnflow test  logmass: p25 -56.243881 median -41.298568 p75 14.589621 avg -20.650284
spnflow logmass computation, elapsed time: 0:03:13
spnflow predict, elapsed time: 0:01:55
spnflow predict, elapsed time: 0:01:42
spnflow predict, elapsed time: 0:01:29
spnflow predict, elapsed time: 0:01:51
spnflow predict, elapsed time: 0:01:39
spnflow predict, elapsed time: 0:01:28
spnflow predict, elapsed time: 0:01:48
spnflow predict, elapsed time: 0:01:37
spnflow predict, elapsed time: 0:01:26
-- Setting 0 -- spnflow:0.5694789110616031
-- Setting 1 -- spnflow:0.5388871841799148
-- Setting 2 -- spnflow:0.5757614402672492
-- Setting 3 -- spnflow:0.5697031850350789
-- Setting 4 -- spnflow:0.584424204503133
-- Setting 5 -- spnflow:0.6111543319160496
-- Setting 6 -- spnflow:0.6022574502857388
-- Setting 7 -- spnflow:0.5941190311260179
-- Setting 8 -- spnflow:0.6421466916031159

Setting 1 -- Query:0.1 Missing:0.1
spnflow 0.5694789110616031

Setting 2 -- Query:0.1 Missing:0.2
spnflow 0.5388871841799148

Setting 3 -- Query:0.1 Missing:0.3
spnflow 0.5757614402672492

Setting 4 -- Query:0.2 Missing:0.1
spnflow 0.5697031850350789

Setting 5 -- Query:0.2 Missing:0.2
spnflow 0.584424204503133

Setting 6 -- Query:0.2 Missing:0.3
spnflow 0.6111543319160496

Setting 7 -- Query:0.3 Missing:0.1
spnflow 0.6022574502857388

Setting 8 -- Query:0.3 Missing:0.2
spnflow 0.5941190311260179

Setting 9 -- Query:0.3 Missing:0.3
spnflow 0.6421466916031159
All done, elapsed time: 0:18:13
