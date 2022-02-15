set -e

# load_limit=2

# while true
# do

# load=`uptime | cut -d ":" -f 5 | cut -d "," -f 3`
# flag=`echo " $load > $load_limit" | bc -l`
# sleep 3
# if [ $flag -eq 0 ]
# then
#     break
# fi

# done


if [ $# -lt 2 ]
then
    echo "input not enough"
    exit -1
fi


if [ $1 = "mark" ]
then

    for name in airquality energy parkinson sdd hepmass miniboone onlinenews superconduct wec_sydney
    do
        python run.py configs/uci/$name.ini -kv "models <- ['ours']; cpus <- 48" -dir output/$2/$name/ours
    done

fi


if [ $1 = "lab" ]
then

    python run.py configs/large/mnist.ini -kv "models <- ['ours']; transform <- imgud((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 12; cpus <- 28" -dir output/$2/imgud
    python run.py configs/large/mnist.ini -kv "models <- ['ours']; transform <- imglr((28,28), DAET, n_components=25, hsize=[200,100,50]); query <- [list(range(25,50)),list(range(25))]; gpuid <- (0,1); gpus <- 12; cpus <- 28" -dir output/$2/imglr
    python run.py configs/uci/z_cropmapping.ini -kv "models <- ['ours']; gpuid <- (0,1); gpus <- 12; cpus <- 28" -dir output/$2/z_cropmapping/ours

fi

