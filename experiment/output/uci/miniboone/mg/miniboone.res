python -u main.py configs/uci/miniboone.ini -dir ./results/uci/miniboone/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/miniboone/mg/miniboone.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
        dir -> ./results/uci/miniboone/mg
Loading miniboone data .....
Raw data size:(36488, 43)
Data preparation, elapsed time: 0:00:01
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -50.112786 median -42.105695 p75 -37.537009 avg -47.835601
CLGBN test  logmass: p25 -51.549051 median -42.877251 p75 -38.651344 avg -48.657196
CLGBN logmass computation, elapsed time: 0:00:16
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -38.912262 median -30.665002 p75 -26.020107 avg -37.166942
MG test  logmass: p25 -40.704615 median -31.126836 p75 -27.157889 avg -37.181859
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
-- Setting 0 -- CLGBN:0.5810250690713591
-- Setting 0 -- MG:0.4165466658831447
-- Setting 1 -- CLGBN:0.6521560552984121
-- Setting 1 -- MG:0.4597660223245127
-- Setting 2 -- CLGBN:0.6623110303438284
-- Setting 2 -- MG:0.47444685076516935
-- Setting 3 -- CLGBN:0.6463372737279603
-- Setting 3 -- MG:0.4655039511707912
-- Setting 4 -- CLGBN:0.7032647658960403
-- Setting 4 -- MG:0.5023029258512719
-- Setting 5 -- CLGBN:0.6870696840937945
-- Setting 5 -- MG:0.515445671111787
-- Setting 6 -- CLGBN:0.6795615706488682
-- Setting 6 -- MG:0.48714329213949426
-- Setting 7 -- CLGBN:0.7035074696156296
-- Setting 7 -- MG:0.5293183424765783
-- Setting 8 -- CLGBN:0.7415420264670517
-- Setting 8 -- MG:0.5758239579893345

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.5810250690713591
   MG 0.4165466658831447

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.6521560552984121
   MG 0.4597660223245127

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.6623110303438284
   MG 0.47444685076516935

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.6463372737279603
   MG 0.4655039511707912

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.7032647658960403
   MG 0.5023029258512719

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.6870696840937945
   MG 0.515445671111787

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.6795615706488682
   MG 0.48714329213949426

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.7035074696156296
   MG 0.5293183424765783

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.7415420264670517
   MG 0.5758239579893345
All done, elapsed time: 0:00:21
