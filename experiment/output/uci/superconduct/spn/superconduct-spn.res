python -u main.py configs/uci/superconduct.ini -dir ./results/raw/uci/superconduct -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/superconduct/superconduct.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
  data_path -> dataset/superconduct/data.csv
       name -> superconduct
loader_name -> superconduct
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
        dir -> ./results/raw/uci/superconduct
Loading the superconduct data.....
Raw data size:(21263, 68)
Data preparation, elapsed time: 0:00:02
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -55.350245 median -38.428713 p75 -26.317931 avg -46.465916
CLGBN test  logmass: p25 -60.862881 median -40.621180 p75 -27.085202 avg -49.418107
CLGBN logmass computation, elapsed time: 0:00:14
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -11.032565 median 7.662412 p75 19.288266 avg -2.042364
MG test  logmass: p25 -15.000862 median 5.400326 p75 19.121695 avg -4.763741
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -50.290032 median -34.356172 p75 -24.430135 avg -41.947863
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 -4.348366 median 11.540308 p75 21.359667 avg 2.458772
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -47.954806 median -31.648194 p75 -22.744834 avg -37.886575
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 1.487446 median 14.302708 p75 22.990707 avg 7.646443
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -43.414030 median -29.420316 p75 -21.117159 avg -35.369944
CLGBN predict, elapsed time: 0:00:00
S2, MG pred logmass: p25 4.701849 median 16.295281 p75 24.051415 avg 9.703164
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -48.507955 median -31.295985 p75 -22.469676 avg -38.827334
CLGBN predict, elapsed time: 0:00:00
S3, MG pred logmass: p25 1.386004 median 13.589264 p75 22.940963 avg 6.277397
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -42.451366 median -29.080552 p75 -21.246305 avg -35.012336
CLGBN predict, elapsed time: 0:00:00
S4, MG pred logmass: p25 5.964385 median 16.258952 p75 24.080133 avg 9.684866
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -37.096787 median -26.547948 p75 -20.071787 avg -31.494967
CLGBN predict, elapsed time: 0:00:00
S5, MG pred logmass: p25 9.559758 median 18.343865 p75 25.175631 avg 13.217468
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -43.462789 median -29.158955 p75 -21.610530 avg -35.331779
CLGBN predict, elapsed time: 0:00:00
S6, MG pred logmass: p25 4.963163 median 16.310191 p75 23.807490 avg 9.312106
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -39.600479 median -25.942697 p75 -19.658454 avg -31.004179
CLGBN predict, elapsed time: 0:00:00
S7, MG pred logmass: p25 8.603541 median 18.748963 p75 25.354906 avg 13.919726
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -32.309045 median -23.946313 p75 -18.765767 avg -28.272212
CLGBN predict, elapsed time: 0:00:00
S8, MG pred logmass: p25 13.007661 median 21.508158 p75 26.201186 avg 16.131444
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.40607140044297013
-- Setting 0 -- MG:0.15285331780737402
-- Setting 1 -- CLGBN:0.43161978264453355
-- Setting 1 -- MG:0.19292937227603535
-- Setting 2 -- CLGBN:0.43282738495780426
-- Setting 2 -- MG:0.19751412579037445
-- Setting 3 -- CLGBN:0.43388354921293526
-- Setting 3 -- MG:0.19401101135901094
-- Setting 4 -- CLGBN:0.4615197680851385
-- Setting 4 -- MG:0.209130169484753
-- Setting 5 -- CLGBN:0.47780225296742523
-- Setting 5 -- MG:0.242454894442333
-- Setting 6 -- CLGBN:0.4580426673958656
-- Setting 6 -- MG:0.2150673934194755
-- Setting 7 -- CLGBN:0.5025278412904126
-- Setting 7 -- MG:0.2563781456987259
-- Setting 8 -- CLGBN:0.5260597203449646
-- Setting 8 -- MG:0.28927165039677893
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:kmeans col split:rdc
spnflow fit, elapsed time: 2:02:46
spnflow train logmass: p25 2.357257 median 84.810783 p75 256.972967 avg 170.484118
spnflow test  logmass: p25 5.114957 median 96.818013 p75 285.552284 avg 176.615722
spnflow logmass computation, elapsed time: 0:01:03
S0, SPN pred logmass: p25 6.313483 median 83.915972 p75 264.331132 avg 160.893191
spnflow predict, elapsed time: 0:00:55
S1, SPN pred logmass: p25 4.432116 median 80.162505 p75 217.131499 avg 143.972786
spnflow predict, elapsed time: 0:00:49
S2, SPN pred logmass: p25 6.303067 median 62.721350 p75 203.460197 avg 127.535421
spnflow predict, elapsed time: 0:00:46
S3, SPN pred logmass: p25 9.239280 median 89.932498 p75 268.654949 avg 165.111262
spnflow predict, elapsed time: 0:00:51
S4, SPN pred logmass: p25 8.532745 median 77.622259 p75 232.805454 avg 147.503402
spnflow predict, elapsed time: 0:00:47
S5, SPN pred logmass: p25 4.829035 median 73.211512 p75 211.313599 avg 131.492386
spnflow predict, elapsed time: 0:00:44
S6, SPN pred logmass: p25 10.836127 median 89.616795 p75 256.286643 avg 167.992891
spnflow predict, elapsed time: 0:00:51
S7, SPN pred logmass: p25 8.309570 median 87.682325 p75 227.943442 avg 147.826949
spnflow predict, elapsed time: 0:00:47
S8, SPN pred logmass: p25 8.306966 median 69.602766 p75 211.550642 avg 134.000755
spnflow predict, elapsed time: 0:00:42
-- Setting 0 -- spnflow:0.19334616926689083
-- Setting 1 -- spnflow:0.19815758279918821
-- Setting 2 -- spnflow:0.19330304812056684
-- Setting 3 -- spnflow:0.20752253883755167
-- Setting 4 -- spnflow:0.19887001649964403
-- Setting 5 -- spnflow:0.20555144216343987
-- Setting 6 -- spnflow:0.20285401940788322
-- Setting 7 -- spnflow:0.20803488678237564
-- Setting 8 -- spnflow:0.21253284293822378

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.40607140044297013
     MG 0.15285331780737402
spnflow 0.19334616926689083

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.43161978264453355
     MG 0.19292937227603535
spnflow 0.19815758279918821

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.43282738495780426
     MG 0.19751412579037445
spnflow 0.19330304812056684

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.43388354921293526
     MG 0.19401101135901094
spnflow 0.20752253883755167

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.4615197680851385
     MG 0.209130169484753
spnflow 0.19887001649964403

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.47780225296742523
     MG 0.242454894442333
spnflow 0.20555144216343987

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.4580426673958656
     MG 0.2150673934194755
spnflow 0.20285401940788322

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.5025278412904126
     MG 0.2563781456987259
spnflow 0.20803488678237564

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.5260597203449646
     MG 0.28927165039677893
spnflow 0.21253284293822378
All done, elapsed time: 2:11:27
