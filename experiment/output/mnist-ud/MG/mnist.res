python -u main.py configs/large/mnist.ini -dir ./results/mnist-ud/MG -kv "models <- ['gbn']; transform <- imgud((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 8; cpus <- 24" | tee -a ./results/mnist-ud/MG/mnist.res
Experiment Configuration:
       name -> mnist
   root_dir -> /home/leondong/proj/ccnet
  data_path -> dataset/mnist/digits/
loader_name -> mnist
down_sample -> False
      noise -> False
      label -> False
     scaler -> None
  transform -> ImgUD(DAET-25-28x28)
     device -> gpu
      query -> [[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]]
    missing -> [0.0]
  cache_dir -> ./cache
     models -> ['gbn']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 24
       gpus -> 8
      gpuid -> (0, 1)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/mnist-ud/MG
Loading mnist data .....
Train data size:(60000, 784)
Test  data size:(10000, 784)
Load pretrained transform instance.
Test rebuild RMSE: 0.07768581722689402
90%+ variables are excluded from being X, disable this feature
Data preparation, elapsed time: 0:00:11
Running GBN ....
CLGBN fit, elapsed time: 0:00:01
CLGBN train logmass: p25 -111.041274 median -104.038911 p75 -98.562598 avg -105.593917
CLGBN test  logmass: p25 -111.346687 median -104.601633 p75 -98.797463 avg -105.970593
CLGBN logmass computation, elapsed time: 0:00:48
MG fit, elapsed time: 0:00:00
MG train logmass: p25 53.396245 median 61.137649 p75 65.991395 avg 55.318751
MG test  logmass: p25 51.748172 median 60.839404 p75 65.840406 avg 56.793135
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -95.846171 median -92.044369 p75 -89.205030 avg -93.107367
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 66.832041 median 70.952210 p75 73.328428 avg 67.826110
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -96.707579 median -91.816009 p75 -88.974588 avg -93.320375
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 67.109819 median 70.931992 p75 73.335526 avg 68.965528
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:(2.32441204729398, 0.20190771643997413)
-- Setting 0 -- MG:(1.774892697476484, 0.17384312031351767)
-- Setting 1 -- CLGBN:(2.340746058273084, 0.19782784543378054)
-- Setting 1 -- MG:(1.7989821851547316, 0.16926821922082091)

Setting 1 -- Query:[25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49] Missing:0.0
CLGBN (2.32441204729398, 0.20190771643997413)
   MG (1.774892697476484, 0.17384312031351767)

Setting 2 -- Query:[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] Missing:0.0
CLGBN (2.340746058273084, 0.19782784543378054)
   MG (1.7989821851547316, 0.16926821922082091)
All done, elapsed time: 0:00:51
