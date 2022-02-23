# this script runs all uci dataset and save the result in the output/uci directory
set -e

for name in  airquality energy parkinson sdd hepmass miniboone onlinenews superconduct wec_sydney z_cropmapping
do
for item in "mg gbn" "rnade rnade" "spn spnet"  "ours ours"
do
        a=( $item )
        directory=${a[0]}
        model=${a[1]}
        mkdir -p output/uci/$name/$directory
        python -u main.py configs/uci/$name.ini -kv "models <- ['${model}']; cpus <- 24" -dir output/uci/$name/$directory | tee output/uci/$name/$directory/re_run.res
done
done
