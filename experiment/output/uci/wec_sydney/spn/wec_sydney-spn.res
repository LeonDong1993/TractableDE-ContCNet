python -u main.py configs/uci/wec_sydney.ini -dir ./results/raw/uci/wec_sydney -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/wec_sydney/wec_sydney.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
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
        dir -> ./results/raw/uci/wec_sydney
Loading WEC-Sydney data .....
Raw data size:(72000, 49)
Data preparation, elapsed time: 0:00:02
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -65.903564 median -60.995684 p75 -57.737617 avg -62.347518
CLGBN test  logmass: p25 -64.180991 median -61.378672 p75 -58.090139 avg -62.053856
CLGBN logmass computation, elapsed time: 0:00:36
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -58.506650 median -47.396731 p75 -38.184527 avg -49.815154
MG test  logmass: p25 -56.180676 median -48.222932 p75 -38.550053 avg -48.627145
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -59.495041 median -56.740718 p75 -54.333435 avg -57.253259
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 -49.727516 median -43.721201 p75 -36.979282 avg -44.211026
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -56.702128 median -54.430660 p75 -52.177265 avg -54.967736
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 -46.675928 median -41.380503 p75 -35.931526 avg -42.016355
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -54.563140 median -52.206951 p75 -50.452403 avg -52.731719
CLGBN predict, elapsed time: 0:00:00
S2, MG pred logmass: p25 -43.672205 median -37.812169 p75 -34.850985 avg -39.628597
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -56.592899 median -54.253940 p75 -52.162321 avg -54.916087
CLGBN predict, elapsed time: 0:00:00
S3, MG pred logmass: p25 -46.689300 median -40.653261 p75 -35.918992 avg -42.036802
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -54.161226 median -52.092078 p75 -50.309541 avg -52.498861
CLGBN predict, elapsed time: 0:00:00
S4, MG pred logmass: p25 -43.279583 median -37.825827 p75 -34.882030 avg -39.571472
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -51.459568 median -49.605130 p75 -47.830816 avg -50.112069
CLGBN predict, elapsed time: 0:00:00
S5, MG pred logmass: p25 -39.983052 median -35.618832 p75 -33.774285 avg -37.476079
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -54.040161 median -51.875041 p75 -50.075079 avg -52.375849
CLGBN predict, elapsed time: 0:00:00
S6, MG pred logmass: p25 -43.057552 median -38.044605 p75 -34.744550 avg -39.518017
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -51.436213 median -49.768996 p75 -48.115517 avg -49.999054
CLGBN predict, elapsed time: 0:00:00
S7, MG pred logmass: p25 -39.926761 median -35.852478 p75 -33.826903 avg -37.177547
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -48.790205 median -47.329263 p75 -45.950769 avg -47.524083
CLGBN predict, elapsed time: 0:00:00
S8, MG pred logmass: p25 -36.973544 median -33.776752 p75 -32.248596 avg -34.795354
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.7729305474973838
-- Setting 0 -- MG:0.5586397127296084
-- Setting 1 -- CLGBN:0.7996379820676458
-- Setting 1 -- MG:0.5961228939081367
-- Setting 2 -- CLGBN:0.7828486618033034
-- Setting 2 -- MG:0.6175036728316396
-- Setting 3 -- CLGBN:0.8007380196999152
-- Setting 3 -- MG:0.6087421431358435
-- Setting 4 -- CLGBN:0.8194234073668659
-- Setting 4 -- MG:0.6526323335885966
-- Setting 5 -- CLGBN:0.825857892115463
-- Setting 5 -- MG:0.6753970628688939
-- Setting 6 -- CLGBN:0.8475893667009244
-- Setting 6 -- MG:0.6639526725093998
-- Setting 7 -- CLGBN:0.857956666502862
-- Setting 7 -- MG:0.7001183927377231
-- Setting 8 -- CLGBN:0.8893706851688548
-- Setting 8 -- MG:0.7503145702826214
Run spnflow ....
Size of hyper-params: 48
Min leaf size:100 row split:kmeans col split:rdc
spnflow fit, elapsed time: 2:47:41
spnflow train logmass: p25 -55.959039 median -36.766363 p75 10.531003 avg -18.525174
spnflow test  logmass: p25 -56.243881 median -41.298568 p75 14.589621 avg -20.650284
spnflow logmass computation, elapsed time: 0:03:08
S0, SPN pred logmass: p25 -47.580584 median -34.587666 p75 13.354150 avg -16.301197
spnflow predict, elapsed time: 0:01:14
S1, SPN pred logmass: p25 -43.267187 median -30.199514 p75 12.876321 avg -15.148281
spnflow predict, elapsed time: 0:01:02
S2, SPN pred logmass: p25 -38.518624 median -26.814757 p75 10.191750 avg -13.302726
spnflow predict, elapsed time: 0:00:57
S3, SPN pred logmass: p25 -44.525611 median -30.576034 p75 19.635973 avg -13.622696
spnflow predict, elapsed time: 0:01:12
S4, SPN pred logmass: p25 -40.515486 median -27.879608 p75 14.466852 avg -12.409059
spnflow predict, elapsed time: 0:01:02
S5, SPN pred logmass: p25 -36.528626 median -22.402321 p75 12.705960 avg -10.949252
spnflow predict, elapsed time: 0:00:53
S6, SPN pred logmass: p25 -42.699626 median -27.628039 p75 20.164523 avg -10.939594
spnflow predict, elapsed time: 0:01:07
S7, SPN pred logmass: p25 -37.586645 median -24.870620 p75 20.023265 avg -9.529697
spnflow predict, elapsed time: 0:00:59
S8, SPN pred logmass: p25 -34.218448 median -21.117555 p75 16.673117 avg -8.714008
spnflow predict, elapsed time: 0:00:53
-- Setting 0 -- spnflow:0.5694789110616028
-- Setting 1 -- spnflow:0.5388871841799147
-- Setting 2 -- spnflow:0.5757614402672491
-- Setting 3 -- spnflow:0.5697031850350792
-- Setting 4 -- spnflow:0.584424204503133
-- Setting 5 -- spnflow:0.61115433191605
-- Setting 6 -- spnflow:0.6022574502857388
-- Setting 7 -- spnflow:0.5941190311260176
-- Setting 8 -- spnflow:0.642146691603116

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.7729305474973838
     MG 0.5586397127296084
spnflow 0.5694789110616028

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.7996379820676458
     MG 0.5961228939081367
spnflow 0.5388871841799147

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.7828486618033034
     MG 0.6175036728316396
spnflow 0.5757614402672491

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.8007380196999152
     MG 0.6087421431358435
spnflow 0.5697031850350792

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.8194234073668659
     MG 0.6526323335885966
spnflow 0.584424204503133

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.825857892115463
     MG 0.6753970628688939
spnflow 0.61115433191605

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.8475893667009244
     MG 0.6639526725093998
spnflow 0.6022574502857388

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.857956666502862
     MG 0.7001183927377231
spnflow 0.5941190311260176

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.8893706851688548
     MG 0.7503145702826214
spnflow 0.642146691603116
All done, elapsed time: 3:00:55
