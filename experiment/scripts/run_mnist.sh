set -e

for item in "MG gbn" "RNADE rnade" "spn spnet"  "ours ours"
do
        a=( $item )
        directory=${a[0]}
        model=${a[1]}
        mkdir -p output/mnist-lr/$directory
        mkdir -p output/mnist-ud/$directory

        python -u main.py configs/large/mnist.ini -kv "models <- ['${model}']; transform <- imglr((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 12; cpus <- 24" -dir output/mnist-lr/$directory | tee output/mnist-lr/$directory/rerun.res
        python -u main.py configs/large/mnist.ini -kv "models <- ['${model}']; transform <- imgud((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 12; cpus <- 24" -dir output/mnist-ud/$directory | tee output/mnist-ud/$directory/rerun.res
        
done
