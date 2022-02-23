python -u main.py configs/uci/sdd.ini -dir ./results/raw/uci/sdd -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/sdd/sdd.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/SDD/Sensorless_drive_diagnosis.txt
       name -> sensorless_drive
loader_name -> SDD
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
        dir -> ./results/raw/uci/sdd
Loading Sensorless_drive_diagnosis data .....
Raw data size:(58509, 29)
Data preparation, elapsed time: 0:00:01
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -31.542481 median -27.350812 p75 -25.052111 avg -30.517198
CLGBN test  logmass: p25 -31.109400 median -26.954956 p75 -25.260292 avg -29.021394
CLGBN logmass computation, elapsed time: 0:00:16
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -28.944329 median -24.707801 p75 -22.396837 avg -31.892793
MG test  logmass: p25 -28.511350 median -24.074733 p75 -22.438584 avg -26.361689
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -29.024776 median -25.311015 p75 -23.934687 avg -27.257597
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 -26.561809 median -22.522155 p75 -21.012378 avg -24.464914
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -27.434929 median -24.762794 p75 -23.519975 avg -26.261517
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 -24.890301 median -21.896296 p75 -20.674760 avg -23.605874
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -25.634317 median -23.866815 p75 -22.778541 avg -25.023156
CLGBN predict, elapsed time: 0:00:00
S2, MG pred logmass: p25 -23.014829 median -21.041429 p75 -19.901329 avg -22.234743
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -26.895091 median -24.826814 p75 -23.416650 avg -26.349701
CLGBN predict, elapsed time: 0:00:00
S3, MG pred logmass: p25 -24.245759 median -21.894530 p75 -20.482990 avg -23.598428
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -26.570527 median -24.155255 p75 -22.751771 avg -25.440766
CLGBN predict, elapsed time: 0:00:00
S4, MG pred logmass: p25 -23.665035 median -21.327290 p75 -19.829823 avg -22.628971
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -25.317631 median -23.470383 p75 -22.334190 avg -24.440153
CLGBN predict, elapsed time: 0:00:00
S5, MG pred logmass: p25 -22.662450 median -20.667990 p75 -19.561266 avg -21.632958
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -26.351671 median -23.993125 p75 -22.773269 avg -25.313578
CLGBN predict, elapsed time: 0:00:00
S6, MG pred logmass: p25 -23.342397 median -21.351259 p75 -19.824876 avg -22.582016
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -25.512419 median -23.419848 p75 -22.191913 avg -24.508163
CLGBN predict, elapsed time: 0:00:00
S7, MG pred logmass: p25 -22.778064 median -20.389497 p75 -19.351473 avg -21.691121
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -24.277679 median -22.800151 p75 -21.878298 avg -23.607885
CLGBN predict, elapsed time: 0:00:00
S8, MG pred logmass: p25 -21.425386 median -19.991989 p75 -18.961166 avg -20.741895
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.505809007150635
-- Setting 0 -- MG:0.47444047602789047
-- Setting 1 -- CLGBN:0.5015240245820493
-- Setting 1 -- MG:0.4507803270459904
-- Setting 2 -- CLGBN:0.5277714364284708
-- Setting 2 -- MG:0.4977181083515834
-- Setting 3 -- CLGBN:0.5559057399331835
-- Setting 3 -- MG:0.5266089038963294
-- Setting 4 -- CLGBN:0.5472841468834198
-- Setting 4 -- MG:0.5088666913505904
-- Setting 5 -- CLGBN:0.5673114404665862
-- Setting 5 -- MG:0.540457132436232
-- Setting 6 -- CLGBN:0.586493272068489
-- Setting 6 -- MG:0.5442750255687933
-- Setting 7 -- CLGBN:0.5898187931004312
-- Setting 7 -- MG:0.5623288345001511
-- Setting 8 -- CLGBN:0.5995639663266494
-- Setting 8 -- MG:0.5775895554521913
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:rdc col split:rdc
spnflow fit, elapsed time: 0:58:55
spnflow train logmass: p25 12.294689 median 17.939613 p75 24.067673 avg 18.855843
spnflow test  logmass: p25 12.100115 median 17.043197 p75 23.833355 avg 18.525616
spnflow logmass computation, elapsed time: 0:02:24
S0, SPN pred logmass: p25 11.103470 median 17.061267 p75 22.982476 avg 17.811706
spnflow predict, elapsed time: 0:00:49
S1, SPN pred logmass: p25 9.002560 median 13.661911 p75 21.003241 avg 15.043016
spnflow predict, elapsed time: 0:00:47
S2, SPN pred logmass: p25 6.847112 median 11.557835 p75 17.550633 avg 12.306455
spnflow predict, elapsed time: 0:00:41
S3, SPN pred logmass: p25 12.555875 median 18.064684 p75 25.325029 avg 19.193562
spnflow predict, elapsed time: 0:00:50
S4, SPN pred logmass: p25 10.862386 median 15.769654 p75 21.077736 avg 16.841742
spnflow predict, elapsed time: 0:00:48
S5, SPN pred logmass: p25 8.841866 median 13.817917 p75 18.716445 avg 14.274808
spnflow predict, elapsed time: 0:00:41
S6, SPN pred logmass: p25 14.330844 median 20.216247 p75 25.615987 avg 21.027939
spnflow predict, elapsed time: 0:00:47
S7, SPN pred logmass: p25 12.113099 median 17.375695 p75 22.830214 avg 18.037059
spnflow predict, elapsed time: 0:00:42
S8, SPN pred logmass: p25 9.756603 median 14.475189 p75 20.920421 avg 15.147155
spnflow predict, elapsed time: 0:00:37
-- Setting 0 -- spnflow:0.34687720866335925
-- Setting 1 -- spnflow:0.32449807268592495
-- Setting 2 -- spnflow:0.3995952933811418
-- Setting 3 -- spnflow:0.40717295544182824
-- Setting 4 -- spnflow:0.4224305194656796
-- Setting 5 -- spnflow:0.46975427312935586
-- Setting 6 -- spnflow:0.49457645289621127
-- Setting 7 -- spnflow:0.5109775938683255
-- Setting 8 -- spnflow:0.510498547045236

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.505809007150635
     MG 0.47444047602789047
spnflow 0.34687720866335925

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.5015240245820493
     MG 0.4507803270459904
spnflow 0.32449807268592495

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.5277714364284708
     MG 0.4977181083515834
spnflow 0.3995952933811418

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.5559057399331835
     MG 0.5266089038963294
spnflow 0.40717295544182824

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.5472841468834198
     MG 0.5088666913505904
spnflow 0.4224305194656796

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.5673114404665862
     MG 0.540457132436232
spnflow 0.46975427312935586

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.586493272068489
     MG 0.5442750255687933
spnflow 0.49457645289621127

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.5898187931004312
     MG 0.5623288345001511
spnflow 0.5109775938683255

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.5995639663266494
     MG 0.5775895554521913
spnflow 0.510498547045236
All done, elapsed time: 1:08:27
