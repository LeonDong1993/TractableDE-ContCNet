python -u main.py configs/uci/miniboone.ini -dir ./results/raw/uci/miniboone -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/miniboone/miniboone.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/miniboone/miniboone.h5
       name -> miniboone
loader_name -> miniboone
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
        dir -> ./results/raw/uci/miniboone
Loading miniboone data .....
Raw data size:(36488, 43)
Data preparation, elapsed time: 0:00:00
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -50.112786 median -42.105695 p75 -37.537009 avg -47.835601
CLGBN test  logmass: p25 -51.549051 median -42.877251 p75 -38.651344 avg -48.657196
CLGBN logmass computation, elapsed time: 0:00:15
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -38.912262 median -30.665002 p75 -26.020107 avg -37.166942
MG test  logmass: p25 -40.704615 median -31.126836 p75 -27.157889 avg -37.181859
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -47.615058 median -39.500230 p75 -36.175503 avg -44.868754
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 -36.333452 median -28.470731 p75 -25.150152 avg -33.462462
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -43.649695 median -37.887106 p75 -35.400060 avg -41.918739
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 -33.147725 median -26.974323 p75 -23.964123 avg -30.757903
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -42.364746 median -36.565788 p75 -33.539403 avg -40.114324
CLGBN predict, elapsed time: 0:00:00
S2, MG pred logmass: p25 -31.257031 median -25.552159 p75 -22.651922 avg -29.055514
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -44.004026 median -38.402707 p75 -35.157518 avg -42.230894
CLGBN predict, elapsed time: 0:00:00
S3, MG pred logmass: p25 -33.400338 median -26.771588 p75 -23.749433 avg -30.777107
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -40.683062 median -35.772539 p75 -33.690478 avg -39.032589
CLGBN predict, elapsed time: 0:00:00
S4, MG pred logmass: p25 -30.070136 median -25.186318 p75 -22.247863 avg -28.059694
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -39.542239 median -35.047540 p75 -32.641536 avg -37.573643
CLGBN predict, elapsed time: 0:00:00
S5, MG pred logmass: p25 -27.929912 median -23.584416 p75 -21.293902 avg -26.462536
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -42.165171 median -36.935025 p75 -33.733729 avg -40.346944
CLGBN predict, elapsed time: 0:00:00
S6, MG pred logmass: p25 -30.737471 median -25.499646 p75 -22.706586 avg -29.021107
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -39.343745 median -34.645371 p75 -32.664944 avg -37.513432
CLGBN predict, elapsed time: 0:00:00
S7, MG pred logmass: p25 -27.428159 median -23.882561 p75 -21.466832 avg -26.413920
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -36.511484 median -33.267523 p75 -31.325082 avg -35.563417
CLGBN predict, elapsed time: 0:00:00
S8, MG pred logmass: p25 -24.962838 median -22.249577 p75 -20.222918 avg -24.604996
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.5810250690713591
-- Setting 0 -- MG:0.4165466658831445
-- Setting 1 -- CLGBN:0.652156055298412
-- Setting 1 -- MG:0.4597660223245128
-- Setting 2 -- CLGBN:0.6623110303438287
-- Setting 2 -- MG:0.47444685076516935
-- Setting 3 -- CLGBN:0.6463372737279609
-- Setting 3 -- MG:0.46550395117079146
-- Setting 4 -- CLGBN:0.7032647658960398
-- Setting 4 -- MG:0.5023029258512719
-- Setting 5 -- CLGBN:0.6870696840937941
-- Setting 5 -- MG:0.515445671111787
-- Setting 6 -- CLGBN:0.6795615706488682
-- Setting 6 -- MG:0.48714329213949403
-- Setting 7 -- CLGBN:0.7035074696156296
-- Setting 7 -- MG:0.5293183424765785
-- Setting 8 -- CLGBN:0.7415420264670513
-- Setting 8 -- MG:0.5758239579893347
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:kmeans col split:rdc
spnflow fit, elapsed time: 1:23:45
spnflow train logmass: p25 -33.741859 median -25.496472 p75 -17.946853 avg -26.771536
spnflow test  logmass: p25 -35.308758 median -27.160453 p75 -21.173637 avg -30.026032
spnflow logmass computation, elapsed time: 0:01:38
S0, SPN pred logmass: p25 -29.883075 median -22.728066 p75 -17.342483 avg -25.059551
spnflow predict, elapsed time: 0:00:46
S1, SPN pred logmass: p25 -27.508252 median -20.365649 p75 -15.935903 avg -22.575326
spnflow predict, elapsed time: 0:00:42
S2, SPN pred logmass: p25 -24.370381 median -17.837544 p75 -13.318210 avg -19.803965
spnflow predict, elapsed time: 0:00:38
S3, SPN pred logmass: p25 -26.653648 median -19.823251 p75 -14.391684 avg -21.955169
spnflow predict, elapsed time: 0:00:47
S4, SPN pred logmass: p25 -24.115386 median -18.028799 p75 -13.256540 avg -19.621816
spnflow predict, elapsed time: 0:00:41
S5, SPN pred logmass: p25 -20.845752 median -15.514396 p75 -11.500552 avg -16.871084
spnflow predict, elapsed time: 0:00:36
S6, SPN pred logmass: p25 -23.786956 median -18.289860 p75 -12.888096 avg -19.967322
spnflow predict, elapsed time: 0:00:44
S7, SPN pred logmass: p25 -21.533341 median -16.014854 p75 -10.847143 avg -16.902436
spnflow predict, elapsed time: 0:00:38
S8, SPN pred logmass: p25 -18.965298 median -14.239447 p75 -8.659392 avg -14.605785
spnflow predict, elapsed time: 0:00:34
-- Setting 0 -- spnflow:0.4980164616626223
-- Setting 1 -- spnflow:0.5209210195712619
-- Setting 2 -- spnflow:0.5530111321788838
-- Setting 3 -- spnflow:0.5246779716504543
-- Setting 4 -- spnflow:0.549257176188469
-- Setting 5 -- spnflow:0.552633155262667
-- Setting 6 -- spnflow:0.5524394114568925
-- Setting 7 -- spnflow:0.5577581784480731
-- Setting 8 -- spnflow:0.5735434300377462

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.5810250690713591
     MG 0.4165466658831445
spnflow 0.4980164616626223

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.652156055298412
     MG 0.4597660223245128
spnflow 0.5209210195712619

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.6623110303438287
     MG 0.47444685076516935
spnflow 0.5530111321788838

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.6463372737279609
     MG 0.46550395117079146
spnflow 0.5246779716504543

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.7032647658960398
     MG 0.5023029258512719
spnflow 0.549257176188469

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.6870696840937941
     MG 0.515445671111787
spnflow 0.552633155262667

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.6795615706488682
     MG 0.48714329213949403
spnflow 0.5524394114568925

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.7035074696156296
     MG 0.5293183424765785
spnflow 0.5577581784480731

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.7415420264670513
     MG 0.5758239579893347
spnflow 0.5735434300377462
All done, elapsed time: 1:31:54
