python -u main.py configs/uci/sdd.ini -dir ./results/uci/sdd/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/sdd/mg/sdd.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
        dir -> ./results/uci/sdd/mg
Loading Sensorless_drive_diagnosis data .....
Raw data size:(58509, 29)
Data preparation, elapsed time: 0:00:01
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -31.542481 median -27.350812 p75 -25.052111 avg -30.517198
CLGBN test  logmass: p25 -31.109400 median -26.954956 p75 -25.260292 avg -29.021394
CLGBN logmass computation, elapsed time: 0:00:17
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -28.944329 median -24.707801 p75 -22.396837 avg -31.892793
MG test  logmass: p25 -28.511350 median -24.074733 p75 -22.438584 avg -26.361689
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
-- Setting 0 -- CLGBN:0.505809007150635
-- Setting 0 -- MG:0.47444047602789097
-- Setting 1 -- CLGBN:0.5015240245820488
-- Setting 1 -- MG:0.4507803270459905
-- Setting 2 -- CLGBN:0.527771436428471
-- Setting 2 -- MG:0.4977181083515829
-- Setting 3 -- CLGBN:0.5559057399331833
-- Setting 3 -- MG:0.5266089038963291
-- Setting 4 -- CLGBN:0.54728414688342
-- Setting 4 -- MG:0.5088666913505903
-- Setting 5 -- CLGBN:0.567311440466586
-- Setting 5 -- MG:0.540457132436232
-- Setting 6 -- CLGBN:0.5864932720684888
-- Setting 6 -- MG:0.544275025568793
-- Setting 7 -- CLGBN:0.589818793100431
-- Setting 7 -- MG:0.5623288345001511
-- Setting 8 -- CLGBN:0.5995639663266493
-- Setting 8 -- MG:0.577589555452191

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.505809007150635
   MG 0.47444047602789097

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.5015240245820488
   MG 0.4507803270459905

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.527771436428471
   MG 0.4977181083515829

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.5559057399331833
   MG 0.5266089038963291

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.54728414688342
   MG 0.5088666913505903

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.567311440466586
   MG 0.540457132436232

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.5864932720684888
   MG 0.544275025568793

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.589818793100431
   MG 0.5623288345001511

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.5995639663266493
   MG 0.577589555452191
All done, elapsed time: 0:00:20
