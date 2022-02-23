python -u main.py configs/uci/z_cropmapping.ini -dir ./results/uci/z_cropmapping/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/z_cropmapping/mg/z_cropmapping.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/cropmapping/data.txt
       name -> cropmapping
loader_name -> cropmapping
     device -> gpu
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
        dir -> ./results/uci/z_cropmapping/mg
Loading crop mapping data .....
Raw data size:(50000, 117)
Data preparation, elapsed time: 0:00:07
Running GBN ....
CLGBN fit, elapsed time: 0:00:03
CLGBN train logmass: p25 -72.586616 median -55.267880 p75 -43.212628 avg -63.345672
CLGBN test  logmass: p25 -70.940225 median -54.845303 p75 -43.091895 avg -62.214233
CLGBN logmass computation, elapsed time: 0:01:00
MG fit, elapsed time: 0:00:00
MG train logmass: p25 25.478363 median 40.448862 p75 50.555444 avg 27.217647
MG test  logmass: p25 28.534975 median 41.003847 p75 51.404658 avg 33.761587
MG logmass computation, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:00
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:01
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:01
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:01
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:01
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:01
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:01
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:01
MG predict, elapsed time: 0:00:00
CLGBN predict, elapsed time: 0:00:01
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.4040199765053397
-- Setting 0 -- MG:0.2236958639483824
-- Setting 1 -- CLGBN:0.4018083222739137
-- Setting 1 -- MG:0.2301075075703446
-- Setting 2 -- CLGBN:0.43364029571123297
-- Setting 2 -- MG:0.25703990601013826
-- Setting 3 -- CLGBN:0.44609127047078845
-- Setting 3 -- MG:0.26753544273191465
-- Setting 4 -- CLGBN:0.44453637087699893
-- Setting 4 -- MG:0.25253067157964915
-- Setting 5 -- CLGBN:0.44181934342381834
-- Setting 5 -- MG:0.2578768432177915
-- Setting 6 -- CLGBN:0.4708842397662647
-- Setting 6 -- MG:0.2810338890056899
-- Setting 7 -- CLGBN:0.4712602950714991
-- Setting 7 -- MG:0.2792741990484138
-- Setting 8 -- CLGBN:0.5044381648748221
-- Setting 8 -- MG:0.31072606096203165

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.4040199765053397
   MG 0.2236958639483824

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.4018083222739137
   MG 0.2301075075703446

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.43364029571123297
   MG 0.25703990601013826

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.44609127047078845
   MG 0.26753544273191465

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.44453637087699893
   MG 0.25253067157964915

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.44181934342381834
   MG 0.2578768432177915

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.4708842397662647
   MG 0.2810338890056899

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.4712602950714991
   MG 0.2792741990484138

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.5044381648748221
   MG 0.31072606096203165
All done, elapsed time: 0:01:17
