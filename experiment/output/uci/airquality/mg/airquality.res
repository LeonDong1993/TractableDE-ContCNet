python -u main.py configs/uci/airquality.ini -dir ./results/uci/airquality/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/airquality/mg/airquality.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
        dir -> ./results/uci/airquality/mg
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
-- Setting 0 -- CLGBN:0.36216138279873905
-- Setting 0 -- MG:0.24072484122268836
-- Setting 1 -- CLGBN:0.41464574521207054
-- Setting 1 -- MG:0.28794381899654065
-- Setting 2 -- CLGBN:0.4369401739798603
-- Setting 2 -- MG:0.3676860442013121
-- Setting 3 -- CLGBN:0.43461732621848465
-- Setting 3 -- MG:0.3192498453620143
-- Setting 4 -- CLGBN:0.47284668443012307
-- Setting 4 -- MG:0.3400432262541436
-- Setting 5 -- CLGBN:0.4759334693898388
-- Setting 5 -- MG:0.3879168128203757
-- Setting 6 -- CLGBN:0.47396098812143367
-- Setting 6 -- MG:0.3606570511689615
-- Setting 7 -- CLGBN:0.5203346179255308
-- Setting 7 -- MG:0.42315208907990365
-- Setting 8 -- CLGBN:0.5736223610055817
-- Setting 8 -- MG:0.4927530379570608

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.36216138279873905
   MG 0.24072484122268836

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.41464574521207054
   MG 0.28794381899654065

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.4369401739798603
   MG 0.3676860442013121

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.43461732621848465
   MG 0.3192498453620143

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.47284668443012307
   MG 0.3400432262541436

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.4759334693898388
   MG 0.3879168128203757

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.47396098812143367
   MG 0.3606570511689615

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.5203346179255308
   MG 0.42315208907990365

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.5736223610055817
   MG 0.4927530379570608
All done, elapsed time: 0:00:02
