python -u main.py configs/uci/hepmass.ini -dir ./results/raw/uci/hepmass -kv "models <- ['gbn','spnet']; gpuid <- (0,1,2); gpus <- 11; cpus <- 48" | tee -a ./results/raw/uci/hepmass/hepmass.res
Experiment Configuration:
   root_dir -> /data/lab/HailiangDong/ccnet
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
     models -> ['gbn', 'spnet']
       seed -> 0
 valid_size -> 200
  test_size -> 200
sample_size -> 200
       cpus -> 48
       gpus -> 11
      gpuid -> (0, 1, 2)
 cross_mode -> True
    shuffle -> True
        dir -> ./results/raw/uci/hepmass
Loading hepmass data .....
Raw data size:(150000, 21)
Data preparation, elapsed time: 0:00:01
Running GBN ....
CLGBN fit, elapsed time: 0:00:00
CLGBN train logmass: p25 -29.887534 median -27.456920 p75 -25.571256 avg -28.177796
CLGBN test  logmass: p25 -30.427632 median -27.860787 p75 -25.998878 avg -28.583614
CLGBN logmass computation, elapsed time: 0:00:29
MG fit, elapsed time: 0:00:00
MG train logmass: p25 -29.641619 median -27.194826 p75 -25.311503 avg -27.924678
MG test  logmass: p25 -30.253927 median -27.726334 p75 -25.731037 avg -28.347557
MG logmass computation, elapsed time: 0:00:00
S0, CLGBN pred logmass: p25 -27.669965 median -25.923286 p75 -24.065431 avg -26.305614
CLGBN predict, elapsed time: 0:00:00
S0, MG pred logmass: p25 -27.499100 median -25.581476 p75 -23.836374 avg -26.066226
MG predict, elapsed time: 0:00:00
S1, CLGBN pred logmass: p25 -26.831706 median -24.658886 p75 -23.158399 avg -25.319151
CLGBN predict, elapsed time: 0:00:00
S1, MG pred logmass: p25 -26.732115 median -24.603772 p75 -22.978720 avg -25.062135
MG predict, elapsed time: 0:00:00
S2, CLGBN pred logmass: p25 -25.859781 median -23.860858 p75 -22.359176 avg -24.458801
CLGBN predict, elapsed time: 0:00:00
S2, MG pred logmass: p25 -25.543573 median -23.760258 p75 -22.109014 avg -24.233113
MG predict, elapsed time: 0:00:00
S3, CLGBN pred logmass: p25 -26.966336 median -24.753571 p75 -23.187224 avg -25.478753
CLGBN predict, elapsed time: 0:00:00
S3, MG pred logmass: p25 -26.687668 median -24.621071 p75 -22.916792 avg -25.245594
MG predict, elapsed time: 0:00:00
S4, CLGBN pred logmass: p25 -25.804953 median -23.917651 p75 -22.068291 avg -24.426408
CLGBN predict, elapsed time: 0:00:00
S4, MG pred logmass: p25 -25.587960 median -23.480679 p75 -21.879853 avg -24.185566
MG predict, elapsed time: 0:00:00
S5, CLGBN pred logmass: p25 -24.435532 median -22.952425 p75 -21.829901 avg -23.524610
CLGBN predict, elapsed time: 0:00:00
S5, MG pred logmass: p25 -24.129231 median -22.729318 p75 -21.592591 avg -23.293867
MG predict, elapsed time: 0:00:00
S6, CLGBN pred logmass: p25 -25.742984 median -23.827908 p75 -22.285780 avg -24.443357
CLGBN predict, elapsed time: 0:00:00
S6, MG pred logmass: p25 -25.772732 median -23.742001 p75 -22.119796 avg -24.194260
MG predict, elapsed time: 0:00:00
S7, CLGBN pred logmass: p25 -24.527056 median -22.704513 p75 -21.323782 avg -23.278076
CLGBN predict, elapsed time: 0:00:00
S7, MG pred logmass: p25 -24.113478 median -22.562579 p75 -21.050363 avg -23.030908
MG predict, elapsed time: 0:00:00
S8, CLGBN pred logmass: p25 -23.213394 median -21.720951 p75 -20.511466 avg -22.196129
CLGBN predict, elapsed time: 0:00:00
S8, MG pred logmass: p25 -23.154844 median -21.529528 p75 -20.306588 avg -21.952596
MG predict, elapsed time: 0:00:00
-- Setting 0 -- CLGBN:0.8248752027241758
-- Setting 0 -- MG:0.8145733779872661
-- Setting 1 -- CLGBN:0.8013017177701863
-- Setting 1 -- MG:0.7875342487437402
-- Setting 2 -- CLGBN:0.8135685033929986
-- Setting 2 -- MG:0.7839912811081596
-- Setting 3 -- CLGBN:0.871400178499424
-- Setting 3 -- MG:0.8573075561347646
-- Setting 4 -- CLGBN:0.8879207369274406
-- Setting 4 -- MG:0.8743716530313057
-- Setting 5 -- CLGBN:0.8446227545063562
-- Setting 5 -- MG:0.82845786034161
-- Setting 6 -- CLGBN:0.8958273623376644
-- Setting 6 -- MG:0.880536174462109
-- Setting 7 -- CLGBN:0.9040960437234346
-- Setting 7 -- MG:0.8977943647731738
-- Setting 8 -- CLGBN:0.8962664506071347
-- Setting 8 -- MG:0.8856777073215095
Run spnflow ....
Size of hyper-params: 48
Min leaf size:50 row split:gmm col split:gvs
spnflow fit, elapsed time: 0:28:38
spnflow train logmass: p25 -27.834408 median -24.560199 p75 -21.704748 avg -25.029415
spnflow test  logmass: p25 -28.565684 median -25.425159 p75 -22.649111 avg -25.801014
spnflow logmass computation, elapsed time: 0:00:20
S0, SPN pred logmass: p25 -24.488575 median -21.362371 p75 -19.261759 avg -21.860337
spnflow predict, elapsed time: 0:00:03
S1, SPN pred logmass: p25 -22.625686 median -19.538489 p75 -17.351876 avg -19.878032
spnflow predict, elapsed time: 0:00:03
S2, SPN pred logmass: p25 -19.434588 median -17.204716 p75 -15.055485 avg -17.496808
spnflow predict, elapsed time: 0:00:03
S3, SPN pred logmass: p25 -23.334714 median -20.683973 p75 -18.038731 avg -21.051763
spnflow predict, elapsed time: 0:00:04
S4, SPN pred logmass: p25 -20.340693 median -18.343985 p75 -15.708053 avg -18.568070
spnflow predict, elapsed time: 0:00:03
S5, SPN pred logmass: p25 -18.484340 median -16.533140 p75 -13.809129 avg -16.447388
spnflow predict, elapsed time: 0:00:03
S6, SPN pred logmass: p25 -22.080066 median -19.415042 p75 -17.163426 avg -19.821889
spnflow predict, elapsed time: 0:00:03
S7, SPN pred logmass: p25 -19.802575 median -17.242813 p75 -15.433232 avg -17.677817
spnflow predict, elapsed time: 0:00:03
S8, SPN pred logmass: p25 -16.986448 median -14.876558 p75 -12.417354 avg -14.959906
spnflow predict, elapsed time: 0:00:03
-- Setting 0 -- spnflow:0.9039512025080579
-- Setting 1 -- spnflow:0.8786883346042278
-- Setting 2 -- spnflow:0.8435714219010698
-- Setting 3 -- spnflow:0.9458459751391223
-- Setting 4 -- spnflow:0.9862384890134948
-- Setting 5 -- spnflow:0.9483107466036299
-- Setting 6 -- spnflow:1.0020217328724723
-- Setting 7 -- spnflow:1.0287723255941708
-- Setting 8 -- spnflow:1.0419492356793563

Setting 1 -- Query:0.1 Missing:0.1
  CLGBN 0.8248752027241758
     MG 0.8145733779872661
spnflow 0.9039512025080579

Setting 2 -- Query:0.1 Missing:0.2
  CLGBN 0.8013017177701863
     MG 0.7875342487437402
spnflow 0.8786883346042278

Setting 3 -- Query:0.1 Missing:0.3
  CLGBN 0.8135685033929986
     MG 0.7839912811081596
spnflow 0.8435714219010698

Setting 4 -- Query:0.2 Missing:0.1
  CLGBN 0.871400178499424
     MG 0.8573075561347646
spnflow 0.9458459751391223

Setting 5 -- Query:0.2 Missing:0.2
  CLGBN 0.8879207369274406
     MG 0.8743716530313057
spnflow 0.9862384890134948

Setting 6 -- Query:0.2 Missing:0.3
  CLGBN 0.8446227545063562
     MG 0.82845786034161
spnflow 0.9483107466036299

Setting 7 -- Query:0.3 Missing:0.1
  CLGBN 0.8958273623376644
     MG 0.880536174462109
spnflow 1.0020217328724723

Setting 8 -- Query:0.3 Missing:0.2
  CLGBN 0.9040960437234346
     MG 0.8977943647731738
spnflow 1.0287723255941708

Setting 9 -- Query:0.3 Missing:0.3
  CLGBN 0.8962664506071347
     MG 0.8856777073215095
spnflow 1.0419492356793563
All done, elapsed time: 0:30:04
