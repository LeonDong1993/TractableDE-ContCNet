# remove previous files
rm *masks.hdf5
rm prediction*.hdf5

# set env and run
export DATASETSPATH=.
export RESULTSPATH=./output
export PYTHONPATH=./buml:/home/leondong/Dropbox/progData/:$PYTHONPATH
python2 orderlessNADE.py --theano --form MoG --dataset dataset.hdf5 --training_route /train --validation_route /valid --test_route /tests/.* --samples_name data --layerwise --wd 1e-6 --batch_size 100 --pretraining_epochs 15 --epochs 150 --lr 0.005 dataset

# summary of changes
# make the common params same to our model
# since our model using adaptive learning rate, this model using fix learing rate, for stability, we set learing rate to 5e-3 for this model (default is 0.01)
# for other params stays the default
#
