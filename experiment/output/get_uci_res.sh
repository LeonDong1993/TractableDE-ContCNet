# this script retrives test set LL from all models for all  uci datasets

for item in "MG mg" "RNADE rnade" "spnflow spn"  "Ours ours"
do
for name in `ls uci`
do
        a=( $item )
        drt=${a[1]}
        syb=${a[0]}
        #grep "Setting $1 -- $syb" uci/$name/$drt/$name.res | tail -n 1
        grep "$syb test  logmass" uci/$name/$drt/$name.res | tail -n 1
done
echo " "
done




