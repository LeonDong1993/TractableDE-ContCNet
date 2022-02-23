python -u main.py configs/uci/onlinenews.ini -dir ./results/uci/onlinenews/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/onlinenews/mg/onlinenews.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
     models -> ['gbn']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/uci/onlinenews/mg
Loading the onlinenews data.....
Raw data size:(39644, 32)
Data preparation, elapsed time: 0:00:05
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -37.357628 median -32.655540 p75 -29.948409 avg -36.688302
CLGBN test  logmass: p25 -37.240829 median -32.500477 p75 -29.691438 avg -37.500598
CLGBN logmass computation, elapsed time: 0:00:12
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -26.495621 median -21.347900 p75 -18.561183 avg -27.551156
MG test  logmass: p25 -26.452984 median -21.057122 p75 -18.082135 avg -27.194960
MG logmass computation, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.5466416786060602
-- Setting 0 -- MG:0.38747598543316114
-- Setting 1 -- CLGBN:0.6143364948796826
-- Setting 1 -- MG:0.49628431904821396
-- Setting 2 -- CLGBN:0.6230807105431578
-- Setting 2 -- MG:0.5286027976585905
-- Setting 3 -- CLGBN:0.6152901594878939
-- Setting 3 -- MG:0.4894529463523696
-- Setting 4 -- CLGBN:0.6911180475694436
-- Setting 4 -- MG:0.587824000194015
-- Setting 5 -- CLGBN:0.6970153798358484
-- Setting 5 -- MG:0.627079337753564
-- Setting 6 -- CLGBN:0.6332252147773896
-- Setting 6 -- MG:0.5287798711010098
-- Setting 7 -- CLGBN:0.6930540020541395
-- Setting 7 -- MG:0.612009391898983
-- Setting 8 -- CLGBN:0.7505188556770535
-- Setting 8 -- MG:0.7050084239772153

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.5466416786060602
   MG 0.38747598543316114

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.6143364948796826
   MG 0.49628431904821396

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.6230807105431578
   MG 0.5286027976585905

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.6152901594878939
   MG 0.4894529463523696

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.6911180475694436
   MG 0.587824000194015

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.6970153798358484
   MG 0.627079337753564

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.6332252147773896
   MG 0.5287798711010098

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.6930540020541395
   MG 0.612009391898983

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.7505188556770535
   MG 0.7050084239772153
All done, elapsed time: 0:00:16
