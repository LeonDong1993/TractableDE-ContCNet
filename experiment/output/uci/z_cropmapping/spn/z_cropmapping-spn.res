python -u main.py configs/uci/z_cropmapping.ini -dir ./results/raw/uci/z_cropmapping -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/z_cropmapping/z_cropmapping.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
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
        dir -> ./results/raw/uci/z_cropmapping
Loading crop mapping data .....
Raw data size:(50000, 117)
Data preparation, elapsed time: 0:00:08
Running GBN ....
CLGBN fit, elapsed time: 0:00:03
CLGBN train logmass: p25 -72.586616 median -55.267880 p75 -43.212628 avg -63.345672
CLGBN test  logmass: p25 -70.940225 median -54.845303 p75 -43.091895 avg -62.214233
CLGBN logmass computation, elapsed time: 0:01:05
MG fit, elapsed time: 0:00:00
MG train logmass: p25 25.478363 median 40.448862 p75 50.555444 avg 27.217647
MG test  logmass: p25 28.534975 median 41.003847 p75 51.404658 avg 33.761587
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -61.729994 median -45.442410 p75 -37.324544 avg -53.138810
CLGBN predict, elapsed time: 0:00:01
S0, MG pred logmass: p25 35.435145 median 46.616753 p75 54.980865 avg 40.402571
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -55.195420 median -43.542717 p75 -33.778155 avg -48.134339
CLGBN predict, elapsed time: 0:00:01
S1, MG pred logmass: p25 38.369365 median 49.703567 p75 57.703727 avg 45.198151
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -50.043746 median -38.806103 p75 -31.099262 avg -43.081686
CLGBN predict, elapsed time: 0:00:01
S2, MG pred logmass: p25 44.088215 median 52.949593 p75 59.864518 avg 49.607721
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -54.962885 median -42.127862 p75 -33.735235 avg -47.619834
CLGBN predict, elapsed time: 0:00:01
S3, MG pred logmass: p25 40.003440 median 48.855354 p75 57.714239 avg 44.627794
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -49.299505 median -38.001037 p75 -30.464350 avg -43.249989
CLGBN predict, elapsed time: 0:00:01
S4, MG pred logmass: p25 43.242936 median 52.188796 p75 60.601273 avg 48.372704
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -45.826408 median -34.857017 p75 -28.254474 avg -38.788463
CLGBN predict, elapsed time: 0:00:01
S5, MG pred logmass: p25 47.903540 median 56.221692 p75 62.745210 avg 52.530648
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -48.929745 median -37.555029 p75 -30.080840 avg -42.610875
CLGBN predict, elapsed time: 0:00:01
S6, MG pred logmass: p25 44.759516 median 53.232791 p75 60.719911 avg 49.404570
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -43.128169 median -34.384145 p75 -27.255200 avg -37.980162
CLGBN predict, elapsed time: 0:00:01
S7, MG pred logmass: p25 47.311159 median 55.929956 p75 62.241695 avg 52.488828
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -36.962830 median -28.568954 p75 -23.141679 avg -32.500669
CLGBN predict, elapsed time: 0:00:01
S8, MG pred logmass: p25 54.038881 median 59.874359 p75 65.443049 avg 57.982476
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.40401997650533955
-- Setting 0 -- MG:0.22369586394838234
-- Setting 1 -- CLGBN:0.40180832227391383
-- Setting 1 -- MG:0.23010750757034454
-- Setting 2 -- CLGBN:0.4336402957112331
-- Setting 2 -- MG:0.2570399060101382
-- Setting 3 -- CLGBN:0.4460912704707885
-- Setting 3 -- MG:0.26753544273191476
-- Setting 4 -- CLGBN:0.44453637087699915
-- Setting 4 -- MG:0.2525306715796492
-- Setting 5 -- CLGBN:0.44181934342381846
-- Setting 5 -- MG:0.2578768432177915
-- Setting 6 -- CLGBN:0.47088423976626465
-- Setting 6 -- MG:0.2810338890056898
-- Setting 7 -- CLGBN:0.47126029507149925
-- Setting 7 -- MG:0.2792741990484138
-- Setting 8 -- CLGBN:0.5044381648748222
-- Setting 8 -- MG:0.31072606096203154
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:kmeans col split:rdc
spnflow fit, elapsed time: 14:58:32
spnflow train logmass: p25 15.530053 median 53.421172 p75 92.417077 avg 51.722983
spnflow test  logmass: p25 10.884399 median 50.125554 p75 92.351544 avg 46.458980
spnflow logmass computation, elapsed time: 0:11:20
S0, SPN pred logmass: p25 18.278945 median 49.411992 p75 89.346259 avg 47.169713
spnflow predict, elapsed time: 0:04:20
S1, SPN pred logmass: p25 14.383363 median 43.527105 p75 81.979653 avg 43.155228
spnflow predict, elapsed time: 0:03:50
S2, SPN pred logmass: p25 9.864752 median 37.369554 p75 68.820208 avg 37.939647
spnflow predict, elapsed time: 0:03:26
S3, SPN pred logmass: p25 23.977375 median 57.488608 p75 92.345095 avg 54.693065
spnflow predict, elapsed time: 0:04:12
S4, SPN pred logmass: p25 19.810410 median 50.465677 p75 84.542598 avg 47.931160
spnflow predict, elapsed time: 0:03:47
S5, SPN pred logmass: p25 17.790211 median 42.625182 p75 69.039528 avg 42.541350
spnflow predict, elapsed time: 0:03:25
S6, SPN pred logmass: p25 30.723521 median 58.801598 p75 99.389011 avg 60.411399
spnflow predict, elapsed time: 0:04:00
S7, SPN pred logmass: p25 28.407378 median 51.602091 p75 87.269235 avg 54.933762
spnflow predict, elapsed time: 0:03:34
S8, SPN pred logmass: p25 23.864936 median 50.449362 p75 77.477856 avg 50.527136
spnflow predict, elapsed time: 0:03:00
-- Setting 0 -- spnflow:0.324480108582032
-- Setting 1 -- spnflow:0.33988690160003465
-- Setting 2 -- spnflow:0.3350801685939665
-- Setting 3 -- spnflow:0.3471630641839748
-- Setting 4 -- spnflow:0.32570883092049163
-- Setting 5 -- spnflow:0.33299224630646174
-- Setting 6 -- spnflow:0.34202757194176875
-- Setting 7 -- spnflow:0.3371767307788693
-- Setting 8 -- spnflow:0.3590459719140624

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.40401997650533955
     MG 0.22369586394838234
spnflow 0.324480108582032

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.40180832227391383
     MG 0.23010750757034454
spnflow 0.33988690160003465

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.4336402957112331
     MG 0.2570399060101382
spnflow 0.3350801685939665

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.4460912704707885
     MG 0.26753544273191476
spnflow 0.3471630641839748

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.44453637087699915
     MG 0.2525306715796492
spnflow 0.32570883092049163

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.44181934342381846
     MG 0.2578768432177915
spnflow 0.33299224630646174

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.47088423976626465
     MG 0.2810338890056898
spnflow 0.34202757194176875

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.47126029507149925
     MG 0.2792741990484138
spnflow 0.3371767307788693

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.5044381648748222
     MG 0.31072606096203154
spnflow 0.3590459719140624
All done, elapsed time: 15:44:55
