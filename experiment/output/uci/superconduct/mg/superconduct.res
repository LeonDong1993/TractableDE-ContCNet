python -u main.py configs/uci/superconduct.ini -dir ./results/uci/superconduct/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/superconduct/mg/superconduct.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
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
        dir -> ./results/uci/superconduct/mg
Loading the superconduct data.....
Raw data size:(21263, 68)
Data preparation, elapsed time: 0:00:03
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -55.350245 median -38.428713 p75 -26.317931 avg -46.465916
CLGBN test  logmass: p25 -60.862881 median -40.621180 p75 -27.085202 avg -49.418107
CLGBN logmass computation, elapsed time: 0:00:14
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -11.032565 median 7.662412 p75 19.288266 avg -2.042364
MG test  logmass: p25 -15.000862 median 5.400326 p75 19.121695 avg -4.763741
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
-- Setting 0 -- CLGBN:0.40607140044297013
-- Setting 0 -- MG:0.15285331780737413
-- Setting 1 -- CLGBN:0.43161978264453343
-- Setting 1 -- MG:0.19292937227603538
-- Setting 2 -- CLGBN:0.4328273849578041
-- Setting 2 -- MG:0.19751412579037436
-- Setting 3 -- CLGBN:0.4338835492129352
-- Setting 3 -- MG:0.194011011359011
-- Setting 4 -- CLGBN:0.46151976808513817
-- Setting 4 -- MG:0.20913016948475302
-- Setting 5 -- CLGBN:0.477802252967425
-- Setting 5 -- MG:0.24245489444233306
-- Setting 6 -- CLGBN:0.4580426673958656
-- Setting 6 -- MG:0.2150673934194755
-- Setting 7 -- CLGBN:0.5025278412904128
-- Setting 7 -- MG:0.256378145698726
-- Setting 8 -- CLGBN:0.5260597203449645
-- Setting 8 -- MG:0.28927165039677893

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.40607140044297013
   MG 0.15285331780737413

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.43161978264453343
   MG 0.19292937227603538

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.4328273849578041
   MG 0.19751412579037436

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.4338835492129352
   MG 0.194011011359011

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.46151976808513817
   MG 0.20913016948475302

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.477802252967425
   MG 0.24245489444233306

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.4580426673958656
   MG 0.2150673934194755

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.5025278412904128
   MG 0.256378145698726

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.5260597203449645
   MG 0.28927165039677893
All done, elapsed time: 0:00:23
