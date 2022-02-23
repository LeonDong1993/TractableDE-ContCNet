python -u main.py configs/uci/parkinson.ini -dir ./results/raw/uci/parkinson -kv "models <- ['rnade']" | tee -a ./results/raw/uci/parkinson/parkinson.res
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
        dir -> ./results/raw/uci/parkinson
Loading parkinson data .....
Raw data size:(5875, 15)
Data preparation, elapsed time: 0:00:00
Run RNADE ....
Size of hyper-params: 48
#comps:10 weight decay:0 lrate:0.00625
RNADE fit, elapsed time: 0:22:56
RNADE train logmass: p25 -6.383317 median -2.549294 p75 0.879297 avg -3.461618
RNADE test  logmass: p25 -6.525131 median -2.890570 p75 0.904870 avg -3.898756
RNADE logmass computation, elapsed time: 0:00:03
S0, RNADE pred logmass: p25 -3.957818 median -0.599352 p75 2.792780 avg -1.615279
RNADE predict, elapsed time: 0:00:15
S1, RNADE pred logmass: p25 -3.434362 median -0.059972 p75 3.081067 avg -1.104689
RNADE predict, elapsed time: 0:00:17
S2, RNADE pred logmass: p25 -3.553532 median 0.538653 p75 3.289630 avg -0.784878
RNADE predict, elapsed time: 0:00:20
S3, RNADE pred logmass: p25 -3.107113 median 0.004118 p75 3.007410 avg -1.078632
RNADE predict, elapsed time: 0:00:17
S4, RNADE pred logmass: p25 -2.695774 median 0.469048 p75 3.963109 avg -0.464090
RNADE predict, elapsed time: 0:00:20
S5, RNADE pred logmass: p25 -2.330781 median 1.153265 p75 3.658009 avg -0.054895
RNADE predict, elapsed time: 0:00:23
S6, RNADE pred logmass: p25 -2.675235 median 0.400876 p75 3.631669 avg -0.523053
RNADE predict, elapsed time: 0:00:20
S7, RNADE pred logmass: p25 -2.769778 median 0.819507 p75 4.129939 avg -0.075552
RNADE predict, elapsed time: 0:00:22
S8, RNADE pred logmass: p25 -1.956726 median 1.762759 p75 4.488319 avg 0.565861
RNADE predict, elapsed time: 0:00:26
-- Setting 0 -- RNADE:0.3764492598164865
-- Setting 1 -- RNADE:0.4781591230678902
-- Setting 2 -- RNADE:0.42125589983534134
-- Setting 3 -- RNADE:0.48975911874644723
-- Setting 4 -- RNADE:0.4230396041398019
-- Setting 5 -- RNADE:0.48701482938707435
-- Setting 6 -- RNADE:0.5281433230328834
-- Setting 7 -- RNADE:0.5611610941389706
-- Setting 8 -- RNADE:0.5496675309719669

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.3764492598164865

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.4781591230678902

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.42125589983534134

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.48975911874644723

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.4230396041398019

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.48701482938707435

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.5281433230328834

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.5611610941389706

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.5496675309719669
All done, elapsed time: 0:26:06
python -u main.py configs/uci/parkinson.ini -dir ./results/uci/parkinson/rnade -kv "models <- ['rnade']; cpus <- 28" | tee -a ./results/uci/parkinson/rnade/parkinson.res
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
        dir -> ./results/uci/parkinson/rnade
Loading parkinson data .....
Raw data size:(5875, 15)
Data preparation, elapsed time: 0:00:00
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -6.383317 median -2.549294 p75 0.879297 avg -3.461618
RNADE test  logmass: p25 -6.525131 median -2.890570 p75 0.904870 avg -3.898756
RNADE logmass computation, elapsed time: 0:00:03
RNADE predict, elapsed time: 0:00:14
RNADE predict, elapsed time: 0:00:18
RNADE predict, elapsed time: 0:00:21
RNADE predict, elapsed time: 0:00:17
RNADE predict, elapsed time: 0:00:20
RNADE predict, elapsed time: 0:00:22
RNADE predict, elapsed time: 0:00:20
RNADE predict, elapsed time: 0:00:23
RNADE predict, elapsed time: 0:00:26
-- Setting 0 -- RNADE:0.3720100405751684
-- Setting 1 -- RNADE:0.45590136587034713
-- Setting 2 -- RNADE:0.43562855354411556
-- Setting 3 -- RNADE:0.47821578668504733
-- Setting 4 -- RNADE:0.4199806597729881
-- Setting 5 -- RNADE:0.4495731878051258
-- Setting 6 -- RNADE:0.5164315308756926
-- Setting 7 -- RNADE:0.5445395649796358
-- Setting 8 -- RNADE:0.5500555766540447

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.3720100405751684

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.45590136587034713

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.43562855354411556

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.47821578668504733

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.4199806597729881

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.4495731878051258

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.5164315308756926

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.5445395649796358

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.5500555766540447
All done, elapsed time: 0:03:09
