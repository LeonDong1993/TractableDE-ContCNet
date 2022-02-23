python -u main.py configs/uci/wec_sydney.ini -dir ./results/raw/uci/wec_sydney -kv "models <- ['rnade']" | tee -a ./results/raw/uci/wec_sydney/wec_sydney.res
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
     models -> ['rnade']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/raw/uci/wec_sydney
Loading WEC-Sydney data .....
Raw data size:(72000, 49)
Data preparation, elapsed time: 0:00:03
Run RNADE ....
Size of hyper-params: 48
#comps:2 weight decay:0.001 lrate:0.00625
RNADE fit, elapsed time: 3:39:54
RNADE train logmass: p25 -58.652456 median -42.090247 p75 -4.475601 avg -30.224218
RNADE test  logmass: p25 -59.270933 median -43.430218 p75 -2.760115 avg -29.862165
RNADE logmass computation, elapsed time: 0:00:18
S0, RNADE pred logmass: p25 -52.850163 median -35.024248 p75 6.636978 avg -23.101794
RNADE predict, elapsed time: 0:01:06
S1, RNADE pred logmass: p25 -50.386549 median -31.668610 p75 11.557207 avg -20.513405
RNADE predict, elapsed time: 0:01:34
S2, RNADE pred logmass: p25 -48.222371 median -28.341287 p75 15.227690 avg -18.087456
RNADE predict, elapsed time: 0:02:05
S3, RNADE pred logmass: p25 -50.520716 median -30.048003 p75 9.710159 avg -20.673244
RNADE predict, elapsed time: 0:01:31
S4, RNADE pred logmass: p25 -48.622609 median -28.628786 p75 12.050970 avg -18.218198
RNADE predict, elapsed time: 0:02:06
S5, RNADE pred logmass: p25 -46.474174 median -23.952035 p75 15.069059 avg -15.011885
RNADE predict, elapsed time: 0:02:39
S6, RNADE pred logmass: p25 -47.989643 median -27.475182 p75 12.469842 avg -17.802017
RNADE predict, elapsed time: 0:02:06
S7, RNADE pred logmass: p25 -45.979499 median -26.483927 p75 16.577583 avg -15.188600
RNADE predict, elapsed time: 0:02:31
S8, RNADE pred logmass: p25 -42.896311 median -19.749264 p75 23.151058 avg -11.751854
RNADE predict, elapsed time: 0:03:08
-- Setting 0 -- RNADE:0.6453102496010374
-- Setting 1 -- RNADE:0.6648435424618436
-- Setting 2 -- RNADE:0.6761152497189967
-- Setting 3 -- RNADE:0.6729986150711409
-- Setting 4 -- RNADE:0.6783287521884519
-- Setting 5 -- RNADE:0.7165522743450446
-- Setting 6 -- RNADE:0.7053921731574434
-- Setting 7 -- RNADE:0.6946979088781151
-- Setting 8 -- RNADE:0.7719330370882926

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.6453102496010374

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.6648435424618436

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.6761152497189967

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.6729986150711409

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.6783287521884519

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.7165522743450446

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.7053921731574434

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.6946979088781151

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.7719330370882926
All done, elapsed time: 3:59:03
python -u main.py configs/uci/wec_sydney.ini -dir ./results/uci/wec_sydney/rnade -kv "models <- ['rnade']; cpus <- 28" | tee -a ./results/uci/wec_sydney/rnade/wec_sydney.res
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
     models -> ['rnade']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/uci/wec_sydney/rnade
Loading WEC-Sydney data .....
Raw data size:(72000, 49)
Data preparation, elapsed time: 0:00:02
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -58.652456 median -42.090247 p75 -4.475601 avg -30.224218
RNADE test  logmass: p25 -59.270933 median -43.430218 p75 -2.760115 avg -29.862165
RNADE logmass computation, elapsed time: 0:00:18
RNADE predict, elapsed time: 0:01:05
RNADE predict, elapsed time: 0:01:33
RNADE predict, elapsed time: 0:02:04
RNADE predict, elapsed time: 0:01:36
RNADE predict, elapsed time: 0:02:03
RNADE predict, elapsed time: 0:02:30
RNADE predict, elapsed time: 0:02:05
RNADE predict, elapsed time: 0:02:36
RNADE predict, elapsed time: 0:03:07
-- Setting 0 -- RNADE:0.6451069537646842
-- Setting 1 -- RNADE:0.6439315878196422
-- Setting 2 -- RNADE:0.678170894411364
-- Setting 3 -- RNADE:0.6885009072423768
-- Setting 4 -- RNADE:0.6884671186982271
-- Setting 5 -- RNADE:0.7156183189194641
-- Setting 6 -- RNADE:0.7171030132612607
-- Setting 7 -- RNADE:0.7041675756231414
-- Setting 8 -- RNADE:0.7612230626226597

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.6451069537646842

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.6439315878196422

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.678170894411364

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.6885009072423768

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.6884671186982271

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.7156183189194641

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.7171030132612607

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.7041675756231414

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.7612230626226597
All done, elapsed time: 0:19:02
