python -u main.py configs/uci/hepmass.ini -dir ./results/raw/uci/hepmass -kv "models <- ['rnade']" | tee -a ./results/raw/uci/hepmass/hepmass.res
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
        dir -> ./results/raw/uci/hepmass
Loading hepmass data .....
Raw data size:(150000, 21)
Data preparation, elapsed time: 0:00:02
Run RNADE ....
Size of hyper-params: 48
#comps:2 weight decay:0 lrate:0.0125
RNADE fit, elapsed time: 4:00:43
RNADE train logmass: p25 -24.174150 median -21.049225 p75 -18.317262 avg -21.499327
RNADE test  logmass: p25 -24.481772 median -21.126886 p75 -18.563892 avg -21.773384
RNADE logmass computation, elapsed time: 0:00:17
S0, RNADE pred logmass: p25 -21.541334 median -18.562362 p75 -16.529792 avg -19.163891
RNADE predict, elapsed time: 0:00:18
S1, RNADE pred logmass: p25 -20.589377 median -17.769035 p75 -15.122215 avg -18.130678
RNADE predict, elapsed time: 0:00:26
S2, RNADE pred logmass: p25 -18.603852 median -16.487958 p75 -14.501275 avg -16.978757
RNADE predict, elapsed time: 0:00:30
S3, RNADE pred logmass: p25 -20.390913 median -17.665506 p75 -15.263592 avg -18.152834
RNADE predict, elapsed time: 0:00:24
S4, RNADE pred logmass: p25 -18.669957 median -16.431273 p75 -14.613730 avg -16.826153
RNADE predict, elapsed time: 0:00:31
S5, RNADE pred logmass: p25 -17.885712 median -15.209956 p75 -13.265362 avg -15.802238
RNADE predict, elapsed time: 0:00:37
S6, RNADE pred logmass: p25 -19.311384 median -16.637879 p75 -14.793061 avg -17.348176
RNADE predict, elapsed time: 0:00:30
S7, RNADE pred logmass: p25 -17.644484 median -15.329717 p75 -13.357983 avg -15.773808
RNADE predict, elapsed time: 0:00:38
S8, RNADE pred logmass: p25 -16.223375 median -13.677989 p75 -11.996195 avg -14.330453
RNADE predict, elapsed time: 0:00:46
-- Setting 0 -- RNADE:0.7855938860047342
-- Setting 1 -- RNADE:0.7456017270593026
-- Setting 2 -- RNADE:0.7515586098153056
-- Setting 3 -- RNADE:0.8498456011286174
-- Setting 4 -- RNADE:0.8885996118849449
-- Setting 5 -- RNADE:0.9017399451412706
-- Setting 6 -- RNADE:0.9261883806705952
-- Setting 7 -- RNADE:0.9686202412481321
-- Setting 8 -- RNADE:0.9672359411915898

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.7855938860047342

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.7456017270593026

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.7515586098153056

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.8498456011286174

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.8885996118849449

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.9017399451412706

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.9261883806705952

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.9686202412481321

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.9672359411915898
All done, elapsed time: 4:05:45
python -u main.py configs/uci/hepmass.ini -dir ./results/uci/hepmass/rnade -kv "models <- ['rnade']; cpus <- 28" | tee -a ./results/uci/hepmass/rnade/hepmass.res
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
        dir -> ./results/uci/hepmass/rnade
Loading hepmass data .....
Raw data size:(150000, 21)
Data preparation, elapsed time: 0:00:00
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -24.174150 median -21.049225 p75 -18.317262 avg -21.499327
RNADE test  logmass: p25 -24.481772 median -21.126886 p75 -18.563892 avg -21.773384
RNADE logmass computation, elapsed time: 0:00:17
RNADE predict, elapsed time: 0:00:17
RNADE predict, elapsed time: 0:00:25
RNADE predict, elapsed time: 0:00:32
RNADE predict, elapsed time: 0:00:24
RNADE predict, elapsed time: 0:00:31
RNADE predict, elapsed time: 0:00:38
RNADE predict, elapsed time: 0:00:31
RNADE predict, elapsed time: 0:00:38
RNADE predict, elapsed time: 0:00:47
-- Setting 0 -- RNADE:0.7803338017973616
-- Setting 1 -- RNADE:0.7350804149118062
-- Setting 2 -- RNADE:0.736974795762601
-- Setting 3 -- RNADE:0.8496643014295908
-- Setting 4 -- RNADE:0.8956577848149397
-- Setting 5 -- RNADE:0.8704191905882783
-- Setting 6 -- RNADE:0.9254011972935368
-- Setting 7 -- RNADE:0.9816221224724537
-- Setting 8 -- RNADE:0.9822740245940236

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.7803338017973616

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.7350804149118062

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.736974795762601

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.8496643014295908

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.8956577848149397

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.8704191905882783

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.9254011972935368

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.9816221224724537

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.9822740245940236
All done, elapsed time: 0:05:04
