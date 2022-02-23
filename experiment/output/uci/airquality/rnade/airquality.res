python -u main.py configs/uci/airquality.ini -dir ./results/raw/uci/airquality -kv "models <- ['gbn','spnet','rnade', 'ours']" | tee -a ./results/raw/uci/airquality/airquality.res
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
     models -> ['gbn', 'spnet', 'rnade', 'ours']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/raw/uci/airquality
Loading air quality data .....
Raw data size:(9357, 12)
Data preparation, elapsed time: 0:00:00

Run RNADE ....
Size of hyper-params: 48
#comps:2 weight decay:0 lrate:0.00625
RNADE fit, elapsed time: 0:17:07
RNADE train logmass: p25 1.756319 median 4.822018 p75 7.586375 avg 4.642705
RNADE test  logmass: p25 1.507678 median 4.744886 p75 7.602329 avg 4.691053
RNADE logmass computation, elapsed time: 0:00:03
S0, RNADE pred logmass: p25 3.742033 median 6.618803 p75 10.047895 avg 6.814500
RNADE predict, elapsed time: 0:00:07
S1, RNADE pred logmass: p25 4.219905 median 7.336659 p75 10.362522 avg 7.396057
RNADE predict, elapsed time: 0:00:07
S2, RNADE pred logmass: p25 5.849693 median 8.323866 p75 12.451359 avg 8.857313
RNADE predict, elapsed time: 0:00:07
S3, RNADE pred logmass: p25 4.346862 median 7.224586 p75 10.412814 avg 7.510173
RNADE predict, elapsed time: 0:00:08
S4, RNADE pred logmass: p25 5.170262 median 7.934877 p75 11.373307 avg 8.424943
RNADE predict, elapsed time: 0:00:07
S5, RNADE pred logmass: p25 6.231519 median 9.282882 p75 12.887027 avg 9.195885
RNADE predict, elapsed time: 0:00:07
S6, RNADE pred logmass: p25 5.468718 median 8.610134 p75 13.144417 avg 8.817156
RNADE predict, elapsed time: 0:00:07
S7, RNADE pred logmass: p25 5.999814 median 9.070448 p75 12.800969 avg 9.303173
RNADE predict, elapsed time: 0:00:07
S8, RNADE pred logmass: p25 6.970276 median 10.794883 p75 14.176462 avg 10.263244
RNADE predict, elapsed time: 0:00:07
-- Setting 0 -- RNADE:0.5767304720049911
-- Setting 1 -- RNADE:0.5847972928695593
-- Setting 2 -- RNADE:0.6327707439272348
-- Setting 3 -- RNADE:0.6811074462039841
-- Setting 4 -- RNADE:0.8010010743276917
-- Setting 5 -- RNADE:0.7162299029388498
-- Setting 6 -- RNADE:0.894134253278837
-- Setting 7 -- RNADE:0.873364678205965
-- Setting 8 -- RNADE:0.8717190146165799

python -u main.py configs/uci/airquality.ini -dir ./results/uci/airquality/rnade -kv "models <- ['rnade']; cpus <- 28" | tee -a ./results/uci/airquality/rnade/airquality.res
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
     models -> ['rnade']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 28
       gpus -> 7
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/uci/airquality/rnade
Loading air quality data .....
Raw data size:(9357, 12)
Data preparation, elapsed time: 0:00:00
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 1.756319 median 4.822018 p75 7.586375 avg 4.642705
RNADE test  logmass: p25 1.507678 median 4.744886 p75 7.602329 avg 4.691053
RNADE logmass computation, elapsed time: 0:00:03
RNADE predict, elapsed time: 0:00:07
RNADE predict, elapsed time: 0:00:07
RNADE predict, elapsed time: 0:00:07
RNADE predict, elapsed time: 0:00:07
RNADE predict, elapsed time: 0:00:08
RNADE predict, elapsed time: 0:00:07
RNADE predict, elapsed time: 0:00:07
RNADE predict, elapsed time: 0:00:07
RNADE predict, elapsed time: 0:00:07
-- Setting 0 -- RNADE:0.5851487710794783
-- Setting 1 -- RNADE:0.5536523071626767
-- Setting 2 -- RNADE:0.605461732020766
-- Setting 3 -- RNADE:0.6664600994396078
-- Setting 4 -- RNADE:0.720033607472624
-- Setting 5 -- RNADE:0.7509452850271728
-- Setting 6 -- RNADE:0.8626449305549803
-- Setting 7 -- RNADE:0.8547438956925819
-- Setting 8 -- RNADE:0.8829593459333489

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.5851487710794783

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.5536523071626767

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.605461732020766

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.6664600994396078

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.720033607472624

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.7509452850271728

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.8626449305549803

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.8547438956925819

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.8829593459333489
All done, elapsed time: 0:01:12
