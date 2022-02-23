python -u main.py configs/uci/miniboone.ini -dir ./results/raw/uci/miniboone -kv "models <- ['rnade']" | tee -a ./results/raw/uci/miniboone/miniboone.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/miniboone/miniboone.h5
       name -> miniboone
loader_name -> miniboone
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
        dir -> ./results/raw/uci/miniboone
Loading miniboone data .....
Raw data size:(36488, 43)
Data preparation, elapsed time: 0:00:01
Run RNADE ....
Size of hyper-params: 48
#comps:10 weight decay:0.01 lrate:0.0125
RNADE fit, elapsed time: 2:53:57
RNADE train logmass: p25 -26.477760 median -17.876469 p75 -10.393910 avg -19.524589
RNADE test  logmass: p25 -27.272554 median -18.949151 p75 -10.749277 avg -21.010279
RNADE logmass computation, elapsed time: 0:00:11
S0, RNADE pred logmass: p25 -22.695184 median -14.842247 p75 -7.108434 avg -16.526826
RNADE predict, elapsed time: 0:00:57
S1, RNADE pred logmass: p25 -20.216640 median -12.023800 p75 -4.653708 avg -14.167698
RNADE predict, elapsed time: 0:01:28
S2, RNADE pred logmass: p25 -18.714897 median -10.436362 p75 -3.487805 avg -12.471850
RNADE predict, elapsed time: 0:01:54
S3, RNADE pred logmass: p25 -19.793802 median -12.302068 p75 -4.368668 avg -13.868555
RNADE predict, elapsed time: 0:01:29
S4, RNADE pred logmass: p25 -16.928768 median -10.491171 p75 -4.552568 avg -12.066055
RNADE predict, elapsed time: 0:01:57
S5, RNADE pred logmass: p25 -16.545318 median -8.763856 p75 -0.993322 avg -9.768283
RNADE predict, elapsed time: 0:02:29
S6, RNADE pred logmass: p25 -17.519537 median -11.378890 p75 -3.213737 avg -12.525311
RNADE predict, elapsed time: 0:01:55
S7, RNADE pred logmass: p25 -14.787044 median -8.483027 p75 -1.538139 avg -9.492981
RNADE predict, elapsed time: 0:02:29
S8, RNADE pred logmass: p25 -14.283065 median -6.850079 p75 0.507296 avg -7.834830
RNADE predict, elapsed time: 0:02:54
-- Setting 0 -- RNADE:0.42321413520534384
-- Setting 1 -- RNADE:0.46703783329546944
-- Setting 2 -- RNADE:0.500660170593973
-- Setting 3 -- RNADE:0.47994592581264195
-- Setting 4 -- RNADE:0.5022443980259736
-- Setting 5 -- RNADE:0.521398490737845
-- Setting 6 -- RNADE:0.5066927317072873
-- Setting 7 -- RNADE:0.5485613845941846
-- Setting 8 -- RNADE:0.6037384654843337

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.42321413520534384

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.46703783329546944

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.500660170593973

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.47994592581264195

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.5022443980259736

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.521398490737845

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.5066927317072873

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.5485613845941846

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.6037384654843337
All done, elapsed time: 3:11:46
python -u main.py configs/uci/miniboone.ini -dir ./results/uci/miniboone/rnade -kv "models <- ['rnade']; cpus <- 28" | tee -a ./results/uci/miniboone/rnade/miniboone.res
Experiment Configuration:
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/miniboone/miniboone.h5
       name -> miniboone
loader_name -> miniboone
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
        dir -> ./results/uci/miniboone/rnade
Loading miniboone data .....
Raw data size:(36488, 43)
Data preparation, elapsed time: 0:00:00
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -26.477760 median -17.876469 p75 -10.393910 avg -19.524589
RNADE test  logmass: p25 -27.272554 median -18.949151 p75 -10.749277 avg -21.010279
RNADE logmass computation, elapsed time: 0:00:11
RNADE predict, elapsed time: 0:00:56
RNADE predict, elapsed time: 0:01:29
RNADE predict, elapsed time: 0:01:57
RNADE predict, elapsed time: 0:01:30
RNADE predict, elapsed time: 0:01:59
RNADE predict, elapsed time: 0:02:34
RNADE predict, elapsed time: 0:01:52
RNADE predict, elapsed time: 0:02:34
RNADE predict, elapsed time: 0:02:48
-- Setting 0 -- RNADE:0.4116831447250496
-- Setting 1 -- RNADE:0.4413842935789702
-- Setting 2 -- RNADE:0.5020050904592783
-- Setting 3 -- RNADE:0.463737833384014
-- Setting 4 -- RNADE:0.527236959651495
-- Setting 5 -- RNADE:0.5332606526280766
-- Setting 6 -- RNADE:0.5126553966883649
-- Setting 7 -- RNADE:0.5376887431175866
-- Setting 8 -- RNADE:0.6078849761311405

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.4116831447250496

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.4413842935789702

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.5020050904592783

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.463737833384014

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.527236959651495

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.5332606526280766

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.5126553966883649

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.5376887431175866

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.6078849761311405
All done, elapsed time: 0:17:56
