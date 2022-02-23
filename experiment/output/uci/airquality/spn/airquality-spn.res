python -u main.py configs/uci/airquality.ini -dir ./results/raw/uci/airquality -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/airquality/airquality.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/airquality/AirQualityUCI.csv
       name -> airquality
loader_name -> airquality
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
        dir -> ./results/raw/uci/airquality
Loading air quality data .....
Raw data size:(9357, 12)
Data preparation, elapsed time: 0:00:00
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -11.383248 median -8.740878 p75 -7.093265 avg -10.156295
CLGBN test  logmass: p25 -12.459847 median -8.875488 p75 -7.358725 avg -10.596373
CLGBN logmass computation, elapsed time: 0:00:01
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -8.612554 median -5.870528 p75 -4.444435 avg -7.453548
MG test  logmass: p25 -9.012131 median -5.949481 p75 -4.582845 avg -7.639190
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -10.712055 median -8.190922 p75 -6.697109 avg -9.400531
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 -7.574284 median -5.048563 p75 -4.080301 avg -6.489538
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -10.259498 median -7.720912 p75 -6.383360 avg -9.119746
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 -7.093100 median -4.859721 p75 -3.677735 avg -6.202595
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -8.321737 median -6.748933 p75 -5.537005 avg -7.948923
CLGBN predict, elapsed time: 0:00:00
S2, MG pred logmass: p25 -5.039162 median -3.934870 p75 -2.905408 avg -4.953821
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -9.824427 median -7.838674 p75 -6.313737 avg -8.943692
CLGBN predict, elapsed time: 0:00:00
S3, MG pred logmass: p25 -6.987117 median -4.715047 p75 -3.734749 avg -6.048875
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -9.093246 median -7.192049 p75 -5.887429 avg -8.395268
CLGBN predict, elapsed time: 0:00:00
S4, MG pred logmass: p25 -6.035153 median -4.319507 p75 -3.279152 avg -5.513563
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -7.806354 median -6.358682 p75 -5.319142 avg -7.537545
CLGBN predict, elapsed time: 0:00:00
S5, MG pred logmass: p25 -4.718275 median -3.548384 p75 -2.658295 avg -4.640899
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -8.788599 median -6.969539 p75 -5.681984 avg -8.149130
CLGBN predict, elapsed time: 0:00:00
S6, MG pred logmass: p25 -6.108772 median -3.977213 p75 -3.097917 avg -5.249155
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -7.621282 median -6.447295 p75 -5.587111 avg -7.536717
CLGBN predict, elapsed time: 0:00:00
S7, MG pred logmass: p25 -4.766072 median -3.639453 p75 -2.832971 avg -4.646622
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -6.768790 median -5.511102 p75 -4.782898 avg -6.542564
CLGBN predict, elapsed time: 0:00:00
S8, MG pred logmass: p25 -3.786659 median -2.636901 p75 -2.113658 avg -3.671445
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.36216138279873894
-- Setting 0 -- MG:0.24072484122268833
-- Setting 1 -- CLGBN:0.4146457452120705
-- Setting 1 -- MG:0.28794381899654076
-- Setting 2 -- CLGBN:0.43694017397986024
-- Setting 2 -- MG:0.36768604420131196
-- Setting 3 -- CLGBN:0.4346173262184847
-- Setting 3 -- MG:0.31924984536201434
-- Setting 4 -- CLGBN:0.472846684430123
-- Setting 4 -- MG:0.3400432262541434
-- Setting 5 -- CLGBN:0.47593346938983905
-- Setting 5 -- MG:0.3879168128203757
-- Setting 6 -- CLGBN:0.4739609881214337
-- Setting 6 -- MG:0.36065705116896174
-- Setting 7 -- CLGBN:0.5203346179255309
-- Setting 7 -- MG:0.4231520890799036
-- Setting 8 -- CLGBN:0.5736223610055818
-- Setting 8 -- MG:0.4927530379570611
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:gmm col split:rdc
spnflow fit, elapsed time: 0:02:19
spnflow train logmass: p25 18.002497 median 21.429398 p75 26.188725 avg 29.021973
spnflow test  logmass: p25 17.301769 median 20.779297 p75 26.664592 avg 29.681836
spnflow logmass computation, elapsed time: 0:00:01
S0, SPN pred logmass: p25 16.298056 median 20.036401 p75 27.209356 avg 27.947224
spnflow predict, elapsed time: 0:00:04
S1, SPN pred logmass: p25 14.766999 median 18.499494 p75 25.516294 avg 25.022107
spnflow predict, elapsed time: 0:00:03
S2, SPN pred logmass: p25 7.498341 median 16.471460 p75 21.894952 avg 20.106239
spnflow predict, elapsed time: 0:00:03
S3, SPN pred logmass: p25 17.128682 median 20.956404 p75 26.112738 avg 28.695323
spnflow predict, elapsed time: 0:00:04
S4, SPN pred logmass: p25 11.568203 median 18.623381 p75 24.002362 avg 24.348748
spnflow predict, elapsed time: 0:00:03
S5, SPN pred logmass: p25 6.634067 median 16.554913 p75 20.578566 avg 19.051877
spnflow predict, elapsed time: 0:00:02
S6, SPN pred logmass: p25 18.061864 median 21.589052 p75 26.212548 avg 28.776361
spnflow predict, elapsed time: 0:00:04
S7, SPN pred logmass: p25 16.027159 median 20.490730 p75 24.941747 avg 25.347950
spnflow predict, elapsed time: 0:00:03
S8, SPN pred logmass: p25 7.107943 median 16.305915 p75 21.192568 avg 19.083231
spnflow predict, elapsed time: 0:00:02
-- Setting 0 -- spnflow:0.1526713119218966
-- Setting 1 -- spnflow:0.16457268135319444
-- Setting 2 -- spnflow:0.22012746797405217
-- Setting 3 -- spnflow:0.19202673628213546
-- Setting 4 -- spnflow:0.2535145446742099
-- Setting 5 -- spnflow:0.2654662499816474
-- Setting 6 -- spnflow:0.2717031532053596
-- Setting 7 -- spnflow:0.29645650681578745
-- Setting 8 -- spnflow:0.41840741244929075

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.36216138279873894
     MG 0.24072484122268833
spnflow 0.1526713119218966

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.4146457452120705
     MG 0.28794381899654076
spnflow 0.16457268135319444

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.43694017397986024
     MG 0.36768604420131196
spnflow 0.22012746797405217

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.4346173262184847
     MG 0.31924984536201434
spnflow 0.19202673628213546

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.472846684430123
     MG 0.3400432262541434
spnflow 0.2535145446742099

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.47593346938983905
     MG 0.3879168128203757
spnflow 0.2654662499816474

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.4739609881214337
     MG 0.36065705116896174
spnflow 0.2717031532053596

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.5203346179255309
     MG 0.4231520890799036
spnflow 0.29645650681578745

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.5736223610055818
     MG 0.4927530379570611
spnflow 0.41840741244929075
All done, elapsed time: 0:02:56
