python -u main.py configs/uci/parkinson.ini -dir ./results/uci/parkinson/mg -kv "models <- ['gbn']; cpus <- 28" | tee -a ./results/uci/parkinson/mg/parkinson.res
Experiment Configuration:
       name -> parkinson
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/parkinson/parkinsons_updrs.data
loader_name -> parkinson
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
        dir -> ./results/uci/parkinson/mg
Loading parkinson data .....
Raw data size:(5875, 15)
Data preparation, elapsed time: 0:00:00
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -10.935266 median -8.799645 p75 -7.389971 avg -11.613900
CLGBN test  logmass: p25 -11.026294 median -8.790695 p75 -7.448722 avg -11.712846
CLGBN logmass computation, elapsed time: 0:00:00
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -9.777759 median -7.633720 p75 -6.269174 avg -10.649852
MG test  logmass: p25 -9.726598 median -7.657380 p75 -6.280312 avg -10.565918
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
-- Setting 0 -- CLGBN:0.3769498763352026
-- Setting 0 -- MG:0.34954839135683313
-- Setting 1 -- CLGBN:0.4475622811852019
-- Setting 1 -- MG:0.41261023272806
-- Setting 2 -- CLGBN:0.4219257470344723
-- Setting 2 -- MG:0.3842098328784334
-- Setting 3 -- CLGBN:0.4544936253057344
-- Setting 3 -- MG:0.4237044063705119
-- Setting 4 -- CLGBN:0.4687911732856102
-- Setting 4 -- MG:0.42190618964365423
-- Setting 5 -- CLGBN:0.4558312485268247
-- Setting 5 -- MG:0.4110543505153758
-- Setting 6 -- CLGBN:0.5025033381947422
-- Setting 6 -- MG:0.45844767189729607
-- Setting 7 -- CLGBN:0.531733543735647
-- Setting 7 -- MG:0.4941691524899343
-- Setting 8 -- CLGBN:0.5095221576482103
-- Setting 8 -- MG:0.4864475579455955

Setting 1 -- Query:0.1 Missing:0.1
CLGBN 0.3769498763352026
   MG 0.34954839135683313

Setting 2 -- Query:0.1 Missing:0.2
CLGBN 0.4475622811852019
   MG 0.41261023272806

Setting 3 -- Query:0.1 Missing:0.3
CLGBN 0.4219257470344723
   MG 0.3842098328784334

Setting 4 -- Query:0.2 Missing:0.1
CLGBN 0.4544936253057344
   MG 0.4237044063705119

Setting 5 -- Query:0.2 Missing:0.2
CLGBN 0.4687911732856102
   MG 0.42190618964365423

Setting 6 -- Query:0.2 Missing:0.3
CLGBN 0.4558312485268247
   MG 0.4110543505153758

Setting 7 -- Query:0.3 Missing:0.1
CLGBN 0.5025033381947422
   MG 0.45844767189729607

Setting 8 -- Query:0.3 Missing:0.2
CLGBN 0.531733543735647
   MG 0.4941691524899343

Setting 9 -- Query:0.3 Missing:0.3
CLGBN 0.5095221576482103
   MG 0.4864475579455955
All done, elapsed time: 0:00:02
