python -u main.py configs/uci/energy.ini -dir ./results/raw/uci/energy -kv "models <- ['rnade']" | tee -a ./results/raw/uci/energy/energy.res
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
        dir -> ./results/raw/uci/energy
Loading the energy data.....
Raw data size:(19735, 24)
Data preparation, elapsed time: 0:00:01
Run RNADE ....
Size of hyper-params: 48
#comps:2 weight decay:0.01 lrate:0.00625
RNADE fit, elapsed time: 0:48:21
RNADE train logmass: p25 -9.810401 median -5.766599 p75 -1.695753 avg -5.899766
RNADE test  logmass: p25 -9.517762 median -5.971196 p75 -1.636301 avg -5.849425
RNADE logmass computation, elapsed time: 0:00:05
S0, RNADE pred logmass: p25 -6.694876 median -2.793730 p75 0.384332 avg -3.071660
RNADE predict, elapsed time: 0:00:12
S1, RNADE pred logmass: p25 -4.508926 median -0.648290 p75 2.637625 avg -1.157249
RNADE predict, elapsed time: 0:00:20
S2, RNADE pred logmass: p25 -3.403836 median -0.041614 p75 3.084186 avg -0.344888
RNADE predict, elapsed time: 0:00:22
S3, RNADE pred logmass: p25 -5.065309 median -1.292806 p75 2.181908 avg -1.454351
RNADE predict, elapsed time: 0:00:20
S4, RNADE pred logmass: p25 -3.905226 median -0.564440 p75 2.560885 avg -0.751272
RNADE predict, elapsed time: 0:00:25
S5, RNADE pred logmass: p25 -2.955106 median 0.319620 p75 4.248146 avg 0.383695
RNADE predict, elapsed time: 0:00:27
S6, RNADE pred logmass: p25 -4.136931 median -0.513537 p75 2.622189 avg -0.529849
RNADE predict, elapsed time: 0:00:23
S7, RNADE pred logmass: p25 -3.218246 median -0.048769 p75 3.349782 avg 0.063452
RNADE predict, elapsed time: 0:00:23
S8, RNADE pred logmass: p25 -2.855213 median 0.301745 p75 2.833538 avg 0.202037
RNADE predict, elapsed time: 0:00:25
-- Setting 0 -- RNADE:0.2685054257649076
-- Setting 1 -- RNADE:0.3326024416764817
-- Setting 2 -- RNADE:0.33270793754413047
-- Setting 3 -- RNADE:0.38779765925906856
-- Setting 4 -- RNADE:0.41667580919617114
-- Setting 5 -- RNADE:0.4403604826835468
-- Setting 6 -- RNADE:0.40109100261608704
-- Setting 7 -- RNADE:0.4428887961036396
-- Setting 8 -- RNADE:0.47857864776319176

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.2685054257649076

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.3326024416764817

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.33270793754413047

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.38779765925906856

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.41667580919617114

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.4403604826835468

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.40109100261608704

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.4428887961036396

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.47857864776319176
All done, elapsed time: 0:51:49
python -u main.py configs/uci/energy.ini -dir ./results/uci/energy/rnade -kv "models <- ['rnade']; cpus <- 28" | tee -a ./results/uci/energy/rnade/energy.res
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
        dir -> ./results/uci/energy/rnade
Loading the energy data.....
Raw data size:(19735, 24)
Data preparation, elapsed time: 0:00:00
Run RNADE ....
Load pretrained rnade model.
RNADE fit, elapsed time: 0:00:00
RNADE train logmass: p25 -9.810401 median -5.766599 p75 -1.695753 avg -5.899766
RNADE test  logmass: p25 -9.517762 median -5.971196 p75 -1.636301 avg -5.849425
RNADE logmass computation, elapsed time: 0:00:05
RNADE predict, elapsed time: 0:00:12
RNADE predict, elapsed time: 0:00:19
RNADE predict, elapsed time: 0:00:22
RNADE predict, elapsed time: 0:00:19
RNADE predict, elapsed time: 0:00:24
RNADE predict, elapsed time: 0:00:26
RNADE predict, elapsed time: 0:00:23
RNADE predict, elapsed time: 0:00:24
RNADE predict, elapsed time: 0:00:26
-- Setting 0 -- RNADE:0.26389364743835975
-- Setting 1 -- RNADE:0.33541502870153894
-- Setting 2 -- RNADE:0.33119107417587285
-- Setting 3 -- RNADE:0.3674336421826294
-- Setting 4 -- RNADE:0.4169271487738155
-- Setting 5 -- RNADE:0.4334194520327836
-- Setting 6 -- RNADE:0.40223840673583955
-- Setting 7 -- RNADE:0.4310389297507161
-- Setting 8 -- RNADE:0.48344785039236

Setting 1 -- Query:0.1 Missing:0.1
RNADE 0.26389364743835975

Setting 2 -- Query:0.1 Missing:0.2
RNADE 0.33541502870153894

Setting 3 -- Query:0.1 Missing:0.3
RNADE 0.33119107417587285

Setting 4 -- Query:0.2 Missing:0.1
RNADE 0.3674336421826294

Setting 5 -- Query:0.2 Missing:0.2
RNADE 0.4169271487738155

Setting 6 -- Query:0.2 Missing:0.3
RNADE 0.4334194520327836

Setting 7 -- Query:0.3 Missing:0.1
RNADE 0.40223840673583955

Setting 8 -- Query:0.3 Missing:0.2
RNADE 0.4310389297507161

Setting 9 -- Query:0.3 Missing:0.3
RNADE 0.48344785039236
All done, elapsed time: 0:03:26
