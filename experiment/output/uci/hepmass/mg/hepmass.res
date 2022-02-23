python -u main.py configs/uci/hepmass.ini -dir ./results/uci/hepmass/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/hepmass/mg/hepmass.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/hepmass/hepmass.h5
       name -> hepmass
loader_name -> hepmass
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
        dir -> ./results/uci/hepmass/mg
Loading hepmass data .....
Raw data size:(150000, 21)
Data preparation, elapsed time: 0:00:00
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -29.887534 median -27.456920 p75 -25.571256 avg -28.177796
CLGBN test  logmass: p25 -30.427632 median -27.860787 p75 -25.998878 avg -28.583614
CLGBN logmass computation, elapsed time: 0:00:32
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -29.641619 median -27.194826 p75 -25.311503 avg -27.924678
MG test  logmass: p25 -30.253927 median -27.726334 p75 -25.731037 avg -28.347557
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
-- Setting 0 -- CLGBN:0.824875202724176
-- Setting 0 -- MG:0.8145733779872666
-- Setting 1 -- CLGBN:0.8013017177701866
-- Setting 1 -- MG:0.7875342487437405
-- Setting 2 -- CLGBN:0.8135685033929986
-- Setting 2 -- MG:0.7839912811081604
-- Setting 3 -- CLGBN:0.8714001784994236
-- Setting 3 -- MG:0.8573075561347653
-- Setting 4 -- CLGBN:0.8879207369274402
-- Setting 4 -- MG:0.8743716530313054
-- Setting 5 -- CLGBN:0.8446227545063565
-- Setting 5 -- MG:0.8284578603416094
-- Setting 6 -- CLGBN:0.8958273623376647
-- Setting 6 -- MG:0.8805361744621082
-- Setting 7 -- CLGBN:0.904096043723435
-- Setting 7 -- MG:0.8977943647731741
-- Setting 8 -- CLGBN:0.8962664506071348
-- Setting 8 -- MG:0.8856777073215097

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.824875202724176
   MG 0.8145733779872666

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.8013017177701866
   MG 0.7875342487437405

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.8135685033929986
   MG 0.7839912811081604

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.8714001784994236
   MG 0.8573075561347653

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.8879207369274402
   MG 0.8743716530313054

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.8446227545063565
   MG 0.8284578603416094

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.8958273623376647
   MG 0.8805361744621082

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.904096043723435
   MG 0.8977943647731741

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.8962664506071348
   MG 0.8856777073215097
All done, elapsed time: 0:00:35
