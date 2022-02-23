python -u main.py configs/uci/energy.ini -dir ./results/uci/energy/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/energy/mg/energy.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/energy/data.csv
       name -> energy
loader_name -> energy
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
        dir -> ./results/uci/energy/mg
Loading the energy data.....
Raw data size:(19735, 24)
Data preparation, elapsed time: 0:00:00
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -22.488622 median -18.906182 p75 -16.625692 avg -20.251944
CLGBN test  logmass: p25 -21.627046 median -18.504860 p75 -16.141141 avg -19.563856
CLGBN logmass computation, elapsed time: 0:00:04
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -16.294359 median -12.642209 p75 -10.331061 avg -14.209820
MG test  logmass: p25 -15.313775 median -12.553692 p75 -10.285276 avg -13.627488
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
-- Setting 0 -- CLGBN:0.39239159779080657
-- Setting 0 -- MG:0.2810452232468249
-- Setting 1 -- CLGBN:0.43504664315192954
-- Setting 1 -- MG:0.32511586329580683
-- Setting 2 -- CLGBN:0.47475704720274176
-- Setting 2 -- MG:0.3581185180083646
-- Setting 3 -- CLGBN:0.4804032575236572
-- Setting 3 -- MG:0.37231997535674366
-- Setting 4 -- CLGBN:0.5496085972472207
-- Setting 4 -- MG:0.4359191519138255
-- Setting 5 -- CLGBN:0.5496659100545834
-- Setting 5 -- MG:0.43554005361232695
-- Setting 6 -- CLGBN:0.5253236459296509
-- Setting 6 -- MG:0.41780833041549814
-- Setting 7 -- CLGBN:0.5374853608809658
-- Setting 7 -- MG:0.4234151552176376
-- Setting 8 -- CLGBN:0.5504290808033208
-- Setting 8 -- MG:0.439030207906275

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.39239159779080657
   MG 0.2810452232468249

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.43504664315192954
   MG 0.32511586329580683

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.47475704720274176
   MG 0.3581185180083646

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.4804032575236572
   MG 0.37231997535674366

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.5496085972472207
   MG 0.4359191519138255

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.5496659100545834
   MG 0.43554005361232695

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.5253236459296509
   MG 0.41780833041549814

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.5374853608809658
   MG 0.4234151552176376

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.5504290808033208
   MG 0.439030207906275
All done, elapsed time: 0:00:07
