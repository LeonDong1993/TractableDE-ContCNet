python -u main.py configs/uci/wec_sydney.ini -dir ./results/uci/wec_sydney/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/wec_sydney/mg/wec_sydney.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
        dir -> ./results/uci/wec_sydney/mg
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
-- Setting 0 -- CLGBN:0.772930547497384
-- Setting 0 -- MG:0.5586397127296084
-- Setting 1 -- CLGBN:0.7996379820676459
-- Setting 1 -- MG:0.5961228939081369
-- Setting 2 -- CLGBN:0.7828486618033031
-- Setting 2 -- MG:0.6175036728316394
-- Setting 3 -- CLGBN:0.8007380196999146
-- Setting 3 -- MG:0.6087421431358432
-- Setting 4 -- CLGBN:0.8194234073668656
-- Setting 4 -- MG:0.6526323335885965
-- Setting 5 -- CLGBN:0.8258578921154638
-- Setting 5 -- MG:0.6753970628688939
-- Setting 6 -- CLGBN:0.8475893667009241
-- Setting 6 -- MG:0.6639526725094
-- Setting 7 -- CLGBN:0.8579566665028616
-- Setting 7 -- MG:0.7001183927377232
-- Setting 8 -- CLGBN:0.8893706851688546
-- Setting 8 -- MG:0.7503145702826214

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.772930547497384
   MG 0.5586397127296084

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.7996379820676459
   MG 0.5961228939081369

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.7828486618033031
   MG 0.6175036728316394

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.8007380196999146
   MG 0.6087421431358432

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.8194234073668656
   MG 0.6526323335885965

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.8258578921154638
   MG 0.6753970628688939

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.8475893667009241
   MG 0.6639526725094

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.8579566665028616
   MG 0.7001183927377232

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.8893706851688546
   MG 0.7503145702826214
All done, elapsed time: 0:00:42
