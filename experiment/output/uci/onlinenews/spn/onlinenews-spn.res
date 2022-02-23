python -u main.py configs/uci/onlinenews.ini -dir ./results/raw/uci/onlinenews -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/onlinenews/onlinenews.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/onlinenews/OnlineNewsPopularity.csv
       name -> online_news
loader_name -> onlinenews
     device -> cpu
      query -> [0.1, 0.2, 0.3]
    missing -> [0.1, 0.2, 0.3]
      label -> False
     scaler -> StandardScaler()
  transform -> None
  cache_dir -> ./cache
     models -> ['gbn', 'spnet']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 48
       gpus -> 11
      gpuid -> (0, 1, 2)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/raw/uci/onlinenews
Loading the onlinenews data.....
Raw data size:(39644, 32)
Data preparation, elapsed time: 0:00:03
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -37.357628 median -32.655540 p75 -29.948409 avg -36.688302
CLGBN test  logmass: p25 -37.240829 median -32.500477 p75 -29.691438 avg -37.500598
CLGBN logmass computation, elapsed time: 0:00:12
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -26.495621 median -21.347900 p75 -18.561183 avg -27.551156
MG test  logmass: p25 -26.452984 median -21.057122 p75 -18.082135 avg -27.194960
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -34.824189 median -30.839951 p75 -28.119805 avg -35.408951
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 -23.470898 median -18.925160 p75 -17.015508 avg -24.124934
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -32.615325 median -29.559212 p75 -27.325848 avg -34.044467
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 -21.350065 median -18.164313 p75 -16.013721 avg -23.415443
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -31.883935 median -28.579971 p75 -26.569671 avg -32.171037
CLGBN predict, elapsed time: 0:00:00
S2, MG pred logmass: p25 -20.795525 median -17.227717 p75 -15.294376 avg -21.278117
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -32.973660 median -29.668172 p75 -27.612738 avg -34.383118
CLGBN predict, elapsed time: 0:00:00
S3, MG pred logmass: p25 -21.949422 median -18.131928 p75 -16.129531 avg -23.448750
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -31.267749 median -28.489602 p75 -26.552570 avg -31.575167
CLGBN predict, elapsed time: 0:00:00
S4, MG pred logmass: p25 -20.032273 median -17.037497 p75 -15.359744 avg -20.317209
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -29.920955 median -27.014166 p75 -25.756218 avg -30.529931
CLGBN predict, elapsed time: 0:00:00
S5, MG pred logmass: p25 -18.237185 median -15.930369 p75 -14.534528 avg -19.056959
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -32.364625 median -28.842632 p75 -26.624476 avg -33.034051
CLGBN predict, elapsed time: 0:00:00
S6, MG pred logmass: p25 -20.672013 median -17.419758 p75 -15.463941 avg -21.979935
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -29.839673 median -27.698290 p75 -25.910850 avg -30.022712
CLGBN predict, elapsed time: 0:00:00
S7, MG pred logmass: p25 -18.817167 median -16.222101 p75 -14.669536 avg -18.730753
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -27.919787 median -25.977261 p75 -24.834349 avg -28.328142
CLGBN predict, elapsed time: 0:00:00
S8, MG pred logmass: p25 -16.442593 median -14.637581 p75 -13.592731 avg -17.021746
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.5466416786060604
-- Setting 0 -- MG:0.3874759854331614
-- Setting 1 -- CLGBN:0.6143364948796821
-- Setting 1 -- MG:0.49628431904821385
-- Setting 2 -- CLGBN:0.6230807105431575
-- Setting 2 -- MG:0.5286027976585906
-- Setting 3 -- CLGBN:0.6152901594878937
-- Setting 3 -- MG:0.4894529463523694
-- Setting 4 -- CLGBN:0.6911180475694436
-- Setting 4 -- MG:0.5878240001940154
-- Setting 5 -- CLGBN:0.6970153798358483
-- Setting 5 -- MG:0.627079337753564
-- Setting 6 -- CLGBN:0.6332252147773894
-- Setting 6 -- MG:0.5287798711010097
-- Setting 7 -- CLGBN:0.6930540020541396
-- Setting 7 -- MG:0.612009391898983
-- Setting 8 -- CLGBN:0.750518855677054
-- Setting 8 -- MG:0.7050084239772155
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:rdc col split:rdc
spnflow fit, elapsed time: 0:33:08
spnflow train logmass: p25 46.497433 median 68.918519 p75 90.043960 avg 70.775140
spnflow test  logmass: p25 43.722638 median 67.025924 p75 88.438874 avg 64.881983
spnflow logmass computation, elapsed time: 0:01:08
S0, SPN pred logmass: p25 38.218394 median 63.707111 p75 81.432882 avg 59.776100
spnflow predict, elapsed time: 0:00:33
S1, SPN pred logmass: p25 36.376590 median 54.061623 p75 71.911677 avg 54.382299
spnflow predict, elapsed time: 0:00:30
S2, SPN pred logmass: p25 24.743219 median 44.712772 p75 64.780337 avg 44.595314
spnflow predict, elapsed time: 0:00:26
S3, SPN pred logmass: p25 42.366513 median 64.012387 p75 86.021967 avg 63.289108
spnflow predict, elapsed time: 0:00:36
S4, SPN pred logmass: p25 38.242606 median 57.276091 p75 76.181920 avg 58.739143
spnflow predict, elapsed time: 0:00:29
S5, SPN pred logmass: p25 32.463081 median 50.769134 p75 68.014139 avg 50.977671
spnflow predict, elapsed time: 0:00:25
S6, SPN pred logmass: p25 43.257674 median 68.543542 p75 86.219433 avg 65.778188
spnflow predict, elapsed time: 0:00:31
S7, SPN pred logmass: p25 36.825918 median 60.738611 p75 78.363687 avg 60.437542
spnflow predict, elapsed time: 0:00:29
S8, SPN pred logmass: p25 30.945251 median 49.928443 p75 69.531345 avg 51.101654
spnflow predict, elapsed time: 0:00:24
-- Setting 0 -- spnflow:0.45183970241283034
-- Setting 1 -- spnflow:0.5162104676340941
-- Setting 2 -- spnflow:0.5869566388775022
-- Setting 3 -- spnflow:0.5648687031183592
-- Setting 4 -- spnflow:0.619032064514451
-- Setting 5 -- spnflow:0.7053211190423085
-- Setting 6 -- spnflow:0.5814165814525388
-- Setting 7 -- spnflow:0.7107525498500483
-- Setting 8 -- spnflow:0.8256541232992951

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.5466416786060604
     MG 0.3874759854331614
spnflow 0.45183970241283034

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.6143364948796821
     MG 0.49628431904821385
spnflow 0.5162104676340941

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.6230807105431575
     MG 0.5286027976585906
spnflow 0.5869566388775022

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.6152901594878937
     MG 0.4894529463523694
spnflow 0.5648687031183592

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.6911180475694436
     MG 0.5878240001940154
spnflow 0.619032064514451

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.6970153798358483
     MG 0.627079337753564
spnflow 0.7053211190423085

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.6332252147773894
     MG 0.5287798711010097
spnflow 0.5814165814525388

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.6930540020541396
     MG 0.612009391898983
spnflow 0.7107525498500483

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.750518855677054
     MG 0.7050084239772155
spnflow 0.8256541232992951
All done, elapsed time: 0:39:00
