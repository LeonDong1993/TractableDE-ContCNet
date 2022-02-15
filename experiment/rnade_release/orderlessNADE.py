import os, sys, json, dill
import numpy as np
from scipy.misc import derivative
from optparse import OptionParser
from pdb import set_trace

from utmLib.parmapper import Xmap
from utmLib import utils

def log_message(backends, message):
    for b in backends:
        if b is None:
            continue
        b.write([], "", message)

##################################################################################

def numerical_partial_derivative(func, point, pos):
    # designed for nade.logdensity
    def wrap_func(x):
        item = point.copy()
        item[pos] = x
        return func(item.reshape(-1,1))
    return derivative(wrap_func, point[pos], dx = 1e-5)

def _predict_one_(item, nade, N):
    np.random.seed(0) # fix seed
    nan_idx = np.where(np.isnan(item))[0]
    known = utils.notin(range(item.size), nan_idx)
    samples, _ = nade.lw_sample(evi = (known, item), n = N)
    samples_mass = nade.logdensity(samples.T)
    best_idx = np.argmax(samples_mass)
    x = samples[best_idx]

    n_iter = 0
    dec_rate = 0.3
    init_lrate = 0.1
    minimum_lrate = 1e-4
    grad_thresh = 10
    ret = x

    y = x.copy()
    max_iter = 50
    converged = False
    current_best = -np.inf
    G = np.zeros( (y.size,) )

    while not converged:
        n_iter += 1
        for i in nan_idx:
            G[i] = numerical_partial_derivative(nade.logdensity, y, i)
        G = np.clip(G, -grad_thresh, grad_thresh)

        # Backtracking line search
        lrate = init_lrate
        init_mass = nade.logdensity(y.reshape(-1,1))
        grad_norm_sqaure = np.linalg.norm(G) ** 2

        while lrate > minimum_lrate:
            tmp_y = y+G*lrate
            cur_mass = nade.logdensity(tmp_y.reshape(-1,1))
            if (cur_mass - init_mass) > (0.25 * lrate * grad_norm_sqaure):
                break
            else:
                lrate *= dec_rate

        if lrate > minimum_lrate:
            y += G*lrate
        else:
            converged = True

        if n_iter >= max_iter:
            converged = True

        if grad_norm_sqaure < 1e-6:
            converged = True

        # keep tracking the best, in case procedure
        if cur_mass > current_best:
            current_best = cur_mass
            ret = y
    return ret

# the parallel wrappel for predictions
def nade_predict(nade, test, N, parallel = 1):
    if parallel == 1:
        ret = [_predict_one_(item, nade, N) for item in test]
    else:
        ret = list(Xmap(_predict_one_, test, args = (nade, N), N = parallel))
    return np.array(ret)

# compute the logdensity of dataset
def nade_logmass(nade, dataset, bs = 100):
    ret = []
    N = dataset.shape[0]
    i = 0
    while i < N:
        batch = dataset[i:(i+bs), :]
        i += bs
        ret.append(nade.logdensity(batch.T))
    return np.concatenate(ret)

##################################################################################

def nade_train(data_file, param_file, output_file):
    mypid = os.getpid()
    os.environ["RESULTSPATH"] = './rnade_release/output'
    os.environ["THEANO_FLAGS"] = '"base_compiledir={}/cache/{}"'.format(os.environ["RESULTSPATH"], mypid)

    import Instrumentation
    import Backends
    import Optimization
    import TrainingController
    import Utils
    import Data.utils
    import gc
    from Utils.DropoutMask import create_dropout_masks
    from Utils.theano_helpers import floatX

    parser = OptionParser(usage="usage: %prog [options] results_route")
    parser.add_option("--theano", dest="theano", default=False, action="store_true")
    # Model options
    parser.add_option("--form", dest="form", default="")
    parser.add_option("--n_quantiles", dest="n_quantiles", default=20, type="int")
    parser.add_option("--n_components", dest="n_components", default=10, type="int")
    parser.add_option("--hlayers", dest="hlayers", default=1, type="int")
    parser.add_option("--units", dest="units", default=100, type="int")
    parser.add_option("--nonlinearity", dest="nonlinearity", default="RLU")
    # Training options
    parser.add_option("--layerwise", dest="layerwise", default=False, action="store_true")
    parser.add_option("--training_ll_stop", dest="training_ll_stop", default=np.inf, type="float")
    parser.add_option("--lr", dest="lr", default=0.01, type="float")
    parser.add_option("--decrease_constant", dest="decrease_constant", default=0.1, type="float")
    parser.add_option("--wd", dest="wd", default=0.00, type="float")
    parser.add_option("--momentum", dest="momentum", default=0.9, type="float")
    parser.add_option("--epochs", dest="epochs", default=200, type="int")
    parser.add_option("--pretraining_epochs", dest="pretraining_epochs", default=20, type="int")
    parser.add_option("--epoch_size", dest="epoch_size", default=10, type="int")
    parser.add_option("--batch_size", dest="batch_size", default=100, type="int")
    # Dataset options
    parser.add_option("--dataset", dest="dataset", default="")
    parser.add_option("--training_route", dest="training_route", default="train")
    parser.add_option("--validation_route", dest="validation_route", default="validation")
    parser.add_option("--test_route", dest="test_route", default="test")
    parser.add_option("--samples_name", dest="samples_name", default="data")
    parser.add_option("--normalize", dest="normalize", default=False, action="store_true")
    parser.add_option("--validation_loops", dest="validation_loops", default=16, type="int")
    parser.add_option("--no_validation", dest="no_validation", default=False, action="store_true")
    # Reports
    parser.add_option("--show_training_stop", dest="show_training_stop", default=False, action="store_true")
    parser.add_option("--summary_orderings", dest="summary_orderings", default=10, type="int")
    parser.add_option("--report_mixtures", dest="report_mixtures", default=False, action="store_true")

    gc.set_threshold(gc.get_threshold()[0] / 5)
    # gc.set_debug(gc.DEBUG_UNCOLLECTABLE | gc.DEBUG_INSTANCES | gc.DEBUG_OBJECTS)

    (options, args) = parser.parse_args([])

    ##################################################################################
    with open(param_file) as f:
        config = json.load(f)
    config = utils.dict2obj(config)

    options.form = 'MoG'
    options.theano = True
    options.epochs = config.max_epoch
    options.hlayers = 2
    options.units = 100
    options.no_validation = True
    options.training_route = '/train'
    options.clean_mode = config.clean_mode
    options.samples_name = 'data'
    options.layerwise = True # as stated in paper
    options.normalize = False
    options.pretraining_epochs = config.pre_epoch

    options.name = config.name
    options.batch_size = config.real_batch_size
    options.epoch_size = config.num_batch
    options.n_components = config.ncomps
    options.lr = config.lrate
    options.wd = config.wd
    ##################################################################################

    if options.theano:
        import NADE
    else:
        import npNADE as NADE
        raise Exception("Not implemented yet")

    results_route = os.path.join(os.environ["RESULTSPATH"], options.name)
    try:
        os.makedirs(results_route)
    except OSError:
        pass

    console = None # Backends.Console()
    textfile_log = Backends.TextFile(os.path.join(results_route, "NADE_training_{}.log".format(mypid)))
    hdf5_backend = Backends.HDF5(results_route, "NADE_{}".format(mypid))
    hdf5_backend.write([], "options", options)

    # Read datasets
    training_dataset = Data.BigDataset(data_file, options.training_route, options.samples_name)
    n_visible = training_dataset.get_dimensionality(0)
    # # Calculate normalsation constants
    if options.normalize:
        # Normalise all datasets
        mean, std = Data.utils.get_dataset_statistics(training_dataset)
        training_dataset = Data.utils.normalise_dataset(training_dataset, mean, std)
        hdf5_backend.write([], "normalisation/mean", mean)
        hdf5_backend.write([], "normalisation/std", std)

    # Dataset of masks, always create, leon fixs
    masks_filename = options.name + '_' + str(mypid) + "." + floatX + ".masks"
    masks_route = os.path.join(os.environ["RESULTSPATH"], masks_filename)
    create_dropout_masks(os.environ["RESULTSPATH"], masks_filename, n_visible, ks=1000)
    masks_dataset = Data.BigDataset(masks_route + ".hdf5", "masks/.*", "masks")

    l = 1 if options.layerwise else options.hlayers
    if options.form == "MoG":
        nade_class = NADE.OrderlessMoGNADE
        nade = nade_class(n_visible, options.units, l, options.n_components, nonlinearity=options.nonlinearity)
        loss_function = "sym_masked_neg_loglikelihood_gradient"
    elif options.form == "Bernoulli":
        nade_class = NADE.OrderlessBernoulliNADE
        nade = nade_class(n_visible, options.units, l, nonlinearity=options.nonlinearity)
        loss_function = "sym_masked_neg_loglikelihood_gradient"
    elif options.form == "QR":
        nade_class = NADE.OrderlessQRNADE
        nade = nade_class(n_visible, options.units, l, options.n_quantiles, nonlinearity=options.nonlinearity)
        loss_function = "sym_masked_pinball_loss_gradient"
    else:
        raise Exception("Unknown form")

    if options.layerwise:
        # Pretrain layerwise
        for l in range(1, options.hlayers + 1):
            if l == 1:
                nade.initialize_parameters_from_dataset(training_dataset)
            else:
                nade = nade_class.create_from_smaller_NADE(nade, add_n_hiddens=1)
            # Configure training
            trainer = Optimization.MomentumSGD(nade, nade.__getattribute__(loss_function))
            trainer.set_datasets([training_dataset, masks_dataset])
            trainer.set_learning_rate(options.lr)
            trainer.set_datapoints_as_columns(True)
            trainer.add_controller(TrainingController.AdaptiveLearningRate(options.lr, 0, epochs=options.pretraining_epochs))
            trainer.add_controller(TrainingController.MaxIterations(options.pretraining_epochs))
            trainer.add_controller(TrainingController.ConfigurationSchedule("momentum", [(2, 0), (float('inf'), options.momentum)]))
            trainer.set_updates_per_epoch(options.epoch_size)
            trainer.set_minibatch_size(options.batch_size)
        #    trainer.set_weight_decay_rate(options.wd)
            trainer.add_controller(TrainingController.NaNBreaker())
            # Instrument the training
            trainer.add_instrumentation(Instrumentation.Instrumentation([console, textfile_log, hdf5_backend],
                                                                        Instrumentation.Function("training_loss", lambda ins: ins.get_training_loss())))
            trainer.add_instrumentation(Instrumentation.Instrumentation([console, textfile_log, hdf5_backend], Instrumentation.Configuration()))
            trainer.add_instrumentation(Instrumentation.Instrumentation([console, textfile_log, hdf5_backend], Instrumentation.Timestamp()))
            # Train
            trainer.set_context("pretraining_%d" % l)
            trainer.train()
    else:  # No pretraining
        nade.initialize_parameters_from_dataset(training_dataset)
    # Configure training
    ordering = range(n_visible)
    np.random.shuffle(ordering)
    trainer = Optimization.MomentumSGD(nade, nade.__getattribute__(loss_function))
    trainer.set_datasets([training_dataset, masks_dataset])
    trainer.set_learning_rate(options.lr)
    trainer.set_datapoints_as_columns(True)
    trainer.add_controller(TrainingController.AdaptiveLearningRate(options.lr, 0, epochs=options.epochs))
    trainer.add_controller(TrainingController.MaxIterations(options.epochs))
    if options.training_ll_stop < np.inf:
        trainer.add_controller(TrainingController.TrainingErrorStop(-options.training_ll_stop))  # Assumes that we're doing minimization so negative ll
    trainer.add_controller(TrainingController.ConfigurationSchedule("momentum", [(2, 0), (float('inf'), options.momentum)]))
    trainer.set_updates_per_epoch(options.epoch_size)
    trainer.set_minibatch_size(options.batch_size)
#    trainer.set_weight_decay_rate(options.wd)
    trainer.add_controller(TrainingController.NaNBreaker())
    # Instrument the training
    trainer.add_instrumentation(Instrumentation.Instrumentation([console, textfile_log, hdf5_backend],
                                                                Instrumentation.Function("training_loss", lambda ins: ins.get_training_loss())))
    trainer.add_instrumentation(Instrumentation.Instrumentation([console, textfile_log, hdf5_backend], Instrumentation.Configuration()))
    # trainer.add_instrumentation(Instrumentation.Instrumentation([hdf5_backend], Instrumentation.Parameters(), every = 10))
    trainer.add_instrumentation(Instrumentation.Instrumentation([console, textfile_log, hdf5_backend], Instrumentation.Timestamp()))
    # Train
    trainer.train()

    os.remove(masks_route + ".hdf5")
    if options.clean_mode:
        # clean temp files used only in tuning
        os.remove('{}/NADE_training_{}.log'.format(results_route, mypid))
        os.remove('{}/NADE_{}.hdf5'.format(results_route, mypid))
    #------------------------------------------------------------------------------
    # Report some final performance measurements
    del hdf5_backend

    if trainer.was_successful():
        utils.pkdump(nade, output_file)
    return

if __name__ == '__main__':
    args = sys.argv[1:]

    if args[0] == 'train':
        # need extra 3 args, data_fpath, param_fpath, output_fpath
        nade_train( * args[1:] )

    if args[0] == 'pred':
        # need extra args, nade_fpath, test_fpath, sample_size, ncpus, output_file
        nade = utils.pkload(args[1])
        test = np.loadtxt(args[2], dtype=float, delimiter=',').astype(np.float32)
        pred = nade_predict(nade, test, int(args[3]), parallel = int(args[4]))
        np.savetxt(args[5], pred, fmt='%f', delimiter=',')

    if args[0] == 'mass':
        # need extra args, nade_fpath, test_fpath, output_file
        nade = utils.pkload(args[1])
        data = np.loadtxt(args[2], dtype=float, delimiter=',').astype(np.float32)
        mass = nade_logmass(nade, data, bs = 100)
        np.savetxt(args[3], mass, fmt='%f', delimiter=',')

