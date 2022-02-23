python -u main.py configs/uci/parkinson.ini -dir ./results/raw/uci/parkinson -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/parkinson/parkinson.res
Experiment Configuration:
       name -> parkinson
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/parkinson/parkinsons_updrs.data
loader_name -> parkinson
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
        dir -> ./results/raw/uci/parkinson
Loading parkinson data .....
Raw data size:(5875, 15)
Data preparation, elapsed time: 0:00:00
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -10.935266 median -8.799645 p75 -7.389971 avg -11.613900
CLGBN test  logmass: p25 -11.026294 median -8.790695 p75 -7.448722 avg -11.712846
CLGBN logmass computation, elapsed time: 0:00:00
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -9.777759 median -7.633720 p75 -6.269174 avg -10.649852
MG test  logmass: p25 -9.726598 median -7.657380 p75 -6.280312 avg -10.565918
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -9.565810 median -7.598440 p75 -6.575733 avg -9.700023
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 -8.500385 median -6.402835 p75 -5.496232 avg -8.733674
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -8.951112 median -7.204459 p75 -6.321356 avg -9.311993
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 -7.667279 median -6.098166 p75 -5.203980 avg -8.255487
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -8.333612 median -7.015374 p75 -6.118049 avg -8.852069
CLGBN predict, elapsed time: 0:00:00
S2, MG pred logmass: p25 -7.474459 median -5.828334 p75 -5.025956 avg -7.947652
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -8.923099 median -7.505109 p75 -6.425465 avg -9.203656
CLGBN predict, elapsed time: 0:00:00
S3, MG pred logmass: p25 -7.667941 median -6.250199 p75 -5.313701 avg -8.014254
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -8.265602 median -6.973403 p75 -6.038184 avg -8.526797
CLGBN predict, elapsed time: 0:00:00
S4, MG pred logmass: p25 -7.312080 median -5.844171 p75 -4.902017 avg -7.337813
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -8.160797 median -6.751181 p75 -5.863343 avg -8.346870
CLGBN predict, elapsed time: 0:00:00
S5, MG pred logmass: p25 -7.021888 median -5.530663 p75 -4.843056 avg -7.394269
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -8.315083 median -6.938294 p75 -6.008348 avg -8.748786
CLGBN predict, elapsed time: 0:00:00
S6, MG pred logmass: p25 -7.133905 median -5.733721 p75 -4.945505 avg -7.681779
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -8.036546 median -6.793495 p75 -5.883156 avg -8.138899
CLGBN predict, elapsed time: 0:00:00
S7, MG pred logmass: p25 -6.883590 median -5.603232 p75 -4.774486 avg -6.951477
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -7.539217 median -6.481068 p75 -5.611565 avg -7.771593
CLGBN predict, elapsed time: 0:00:00
S8, MG pred logmass: p25 -6.238345 median -5.300124 p75 -4.348107 avg -6.533830
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.37694987633520255
-- Setting 0 -- MG:0.34954839135683324
-- Setting 1 -- CLGBN:0.4475622811852016
-- Setting 1 -- MG:0.4126102327280602
-- Setting 2 -- CLGBN:0.42192574703447216
-- Setting 2 -- MG:0.3842098328784336
-- Setting 3 -- CLGBN:0.4544936253057344
-- Setting 3 -- MG:0.4237044063705119
-- Setting 4 -- CLGBN:0.46879117328561004
-- Setting 4 -- MG:0.4219061896436544
-- Setting 5 -- CLGBN:0.4558312485268247
-- Setting 5 -- MG:0.41105435051537564
-- Setting 6 -- CLGBN:0.5025033381947422
-- Setting 6 -- MG:0.45844767189729607
-- Setting 7 -- CLGBN:0.5317335437356467
-- Setting 7 -- MG:0.4941691524899342
-- Setting 8 -- CLGBN:0.5095221576482101
-- Setting 8 -- MG:0.4864475579455953
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:kmeans col split:rdc
spnflow fit, elapsed time: 0:01:56
spnflow train logmass: p25 -11.496468 median -7.589957 p75 -4.517090 avg -8.522311
spnflow test  logmass: p25 -12.718261 median -8.275415 p75 -5.303621 avg -9.705956
spnflow logmass computation, elapsed time: 0:00:01
S0, SPN pred logmass: p25 -9.673119 median -7.272227 p75 -4.280468 avg -7.928834
spnflow predict, elapsed time: 0:00:02
S1, SPN pred logmass: p25 -9.760135 median -6.780705 p75 -4.448326 avg -7.610795
spnflow predict, elapsed time: 0:00:02
S2, SPN pred logmass: p25 -9.231518 median -6.783425 p75 -4.774498 avg -7.525692
spnflow predict, elapsed time: 0:00:02
S3, SPN pred logmass: p25 -10.075101 median -6.759353 p75 -3.967824 avg -7.517451
spnflow predict, elapsed time: 0:00:02
S4, SPN pred logmass: p25 -8.782522 median -6.034408 p75 -3.921665 avg -6.851144
spnflow predict, elapsed time: 0:00:02
S5, SPN pred logmass: p25 -8.669194 median -6.133169 p75 -4.056339 avg -6.832321
spnflow predict, elapsed time: 0:00:02
S6, SPN pred logmass: p25 -8.901668 median -5.856958 p75 -3.242106 avg -6.664301
spnflow predict, elapsed time: 0:00:02
S7, SPN pred logmass: p25 -8.713370 median -6.134252 p75 -3.403141 avg -6.621561
spnflow predict, elapsed time: 0:00:02
S8, SPN pred logmass: p25 -7.726458 median -5.403271 p75 -3.167129 avg -5.927397
spnflow predict, elapsed time: 0:00:02
-- Setting 0 -- spnflow:0.38992376259803707
-- Setting 1 -- spnflow:0.44197910869901874
-- Setting 2 -- spnflow:0.43495192305768887
-- Setting 3 -- spnflow:0.43893930451494584
-- Setting 4 -- spnflow:0.45913830130307054
-- Setting 5 -- spnflow:0.4499489104402785
-- Setting 6 -- spnflow:0.4910902499840491
-- Setting 7 -- spnflow:0.5288938821812055
-- Setting 8 -- spnflow:0.5574346842913058

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.37694987633520255
     MG 0.34954839135683324
spnflow 0.38992376259803707

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.4475622811852016
     MG 0.4126102327280602
spnflow 0.44197910869901874

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.42192574703447216
     MG 0.3842098328784336
spnflow 0.43495192305768887

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.4544936253057344
     MG 0.4237044063705119
spnflow 0.43893930451494584

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.46879117328561004
     MG 0.4219061896436544
spnflow 0.45913830130307054

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.4558312485268247
     MG 0.41105435051537564
spnflow 0.4499489104402785

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.5025033381947422
     MG 0.45844767189729607
spnflow 0.4910902499840491

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.5317335437356467
     MG 0.4941691524899342
spnflow 0.5288938821812055

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.5095221576482101
     MG 0.4864475579455953
spnflow 0.5574346842913058
All done, elapsed time: 0:02:25
