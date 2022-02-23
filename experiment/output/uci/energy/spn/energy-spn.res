python -u main.py configs/uci/energy.ini -dir ./results/raw/uci/energy -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/energy/energy.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
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
        dir -> ./results/raw/uci/energy
Loading the energy data.....
Raw data size:(19735, 24)
Data preparation, elapsed time: 0:00:00
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -22.488622 median -18.906182 p75 -16.625692 avg -20.251944
CLGBN test  logmass: p25 -21.627046 median -18.504860 p75 -16.141141 avg -19.563856
CLGBN logmass computation, elapsed time: 0:00:04
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -16.294359 median -12.642209 p75 -10.331061 avg -14.209820
MG test  logmass: p25 -15.313775 median -12.553692 p75 -10.285276 avg -13.627488
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -19.486326 median -16.570784 p75 -14.532054 avg -17.722959
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 -13.103721 median -10.807790 p75 -8.960534 avg -11.936549
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -17.665736 median -15.266855 p75 -13.564973 avg -16.037145
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 -11.562529 median -9.218144 p75 -7.692740 avg -10.098390
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -16.704380 median -14.672643 p75 -13.261871 avg -15.351850
CLGBN predict, elapsed time: 0:00:00
S2, MG pred logmass: p25 -10.512858 median -8.797514 p75 -7.068331 avg -9.431875
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -17.688845 median -15.363640 p75 -13.713736 avg -16.250844
CLGBN predict, elapsed time: 0:00:00
S3, MG pred logmass: p25 -11.947964 median -9.456407 p75 -7.701855 avg -10.432261
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -16.009133 median -14.006051 p75 -12.412971 avg -14.655065
CLGBN predict, elapsed time: 0:00:00
S4, MG pred logmass: p25 -9.931220 median -8.104230 p75 -6.769468 avg -8.832193
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -15.111980 median -13.032077 p75 -11.662675 avg -13.767511
CLGBN predict, elapsed time: 0:00:00
S5, MG pred logmass: p25 -9.103494 median -7.182346 p75 -5.810627 avg -7.962380
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -16.720902 median -14.631761 p75 -12.894017 avg -15.215463
CLGBN predict, elapsed time: 0:00:00
S6, MG pred logmass: p25 -10.780396 median -8.452660 p75 -6.807642 avg -9.385909
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -14.830266 median -13.266816 p75 -11.803999 avg -13.833764
CLGBN predict, elapsed time: 0:00:00
S7, MG pred logmass: p25 -8.985794 median -7.367024 p75 -6.096144 avg -8.044717
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -14.066352 median -12.154326 p75 -11.064133 avg -12.823513
CLGBN predict, elapsed time: 0:00:00
S8, MG pred logmass: p25 -8.085901 median -6.513654 p75 -5.302161 avg -7.015241
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.3923915977908063
-- Setting 0 -- MG:0.28104522324682474
-- Setting 1 -- CLGBN:0.43504664315192926
-- Setting 1 -- MG:0.32511586329580716
-- Setting 2 -- CLGBN:0.47475704720274164
-- Setting 2 -- MG:0.35811851800836486
-- Setting 3 -- CLGBN:0.48040325752365726
-- Setting 3 -- MG:0.3723199753567436
-- Setting 4 -- CLGBN:0.5496085972472208
-- Setting 4 -- MG:0.4359191519138254
-- Setting 5 -- CLGBN:0.5496659100545835
-- Setting 5 -- MG:0.4355400536123271
-- Setting 6 -- CLGBN:0.5253236459296504
-- Setting 6 -- MG:0.4178083304154984
-- Setting 7 -- CLGBN:0.5374853608809655
-- Setting 7 -- MG:0.4234151552176375
-- Setting 8 -- CLGBN:0.5504290808033209
-- Setting 8 -- MG:0.4390302079062748
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:kmeans col split:rdc
spnflow fit, elapsed time: 0:16:44
spnflow train logmass: p25 -0.160041 median 9.640605 p75 20.264408 avg 11.080277
spnflow test  logmass: p25 -2.745350 median 8.028037 p75 18.648308 avg 8.657162
spnflow logmass computation, elapsed time: 0:00:17
S0, SPN pred logmass: p25 -2.585232 median 7.879727 p75 16.955356 avg 8.877459
spnflow predict, elapsed time: 0:00:17
S1, SPN pred logmass: p25 -1.621881 median 5.949854 p75 13.238036 avg 6.851459
spnflow predict, elapsed time: 0:00:15
S2, SPN pred logmass: p25 -2.340742 median 4.378833 p75 11.511069 avg 5.019680
spnflow predict, elapsed time: 0:00:15
S3, SPN pred logmass: p25 0.561463 median 9.505353 p75 17.808812 avg 10.462893
spnflow predict, elapsed time: 0:00:16
S4, SPN pred logmass: p25 -0.708427 median 7.535495 p75 15.433671 avg 8.450181
spnflow predict, elapsed time: 0:00:15
S5, SPN pred logmass: p25 -0.049948 median 6.714322 p75 12.254544 avg 7.557591
spnflow predict, elapsed time: 0:00:14
S6, SPN pred logmass: p25 2.637877 median 10.504302 p75 18.716340 avg 11.594643
spnflow predict, elapsed time: 0:00:17
S7, SPN pred logmass: p25 1.254349 median 8.370763 p75 16.599807 avg 9.822725
spnflow predict, elapsed time: 0:00:15
S8, SPN pred logmass: p25 1.893740 median 7.617693 p75 14.237589 avg 8.632468
spnflow predict, elapsed time: 0:00:14
-- Setting 0 -- spnflow:0.19262748881663846
-- Setting 1 -- spnflow:0.19211493153416193
-- Setting 2 -- spnflow:0.195986227396736
-- Setting 3 -- spnflow:0.2046653031207753
-- Setting 4 -- spnflow:0.20818942810270522
-- Setting 5 -- spnflow:0.21192367112756202
-- Setting 6 -- spnflow:0.2297796581321333
-- Setting 7 -- spnflow:0.24154993647871412
-- Setting 8 -- spnflow:0.2384306348096578

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.3923915977908063
     MG 0.28104522324682474
spnflow 0.19262748881663846

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.43504664315192926
     MG 0.32511586329580716
spnflow 0.19211493153416193

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.47475704720274164
     MG 0.35811851800836486
spnflow 0.195986227396736

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.48040325752365726
     MG 0.3723199753567436
spnflow 0.2046653031207753

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.5496085972472208
     MG 0.4359191519138254
spnflow 0.20818942810270522

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.5496659100545835
     MG 0.4355400536123271
spnflow 0.21192367112756202

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.5253236459296504
     MG 0.4178083304154984
spnflow 0.2297796581321333

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.5374853608809655
     MG 0.4234151552176375
spnflow 0.24154993647871412

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.5504290808033209
     MG 0.4390302079062748
spnflow 0.2384306348096578
All done, elapsed time: 0:19:33
