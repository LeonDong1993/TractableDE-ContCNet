import argparse, glob, os
from utmLib import shell
from utmLib.clses import Timer

def run_experiment(fpath, directory, kv):
    full_fname = fpath.split('/')[-1]
    fname = full_fname[0:-4]
    assert full_fname.endswith('.ini'), "Invalid file type"

    if directory != '':
        if directory.endswith('/'):
            directory += fname
        shell.makedir(directory)
        cmd_str = 'python -u main.py {} -dir {} -kv "{}"'.format(fpath, directory, kv)
        cmd_str += ' | tee -a {}/{}.res'.format(directory, fname)
        # record the command string
        with open('{}/{}.res'.format(directory, fname), 'a+') as f:
            f.write(cmd_str + '\n')
    else:
        cmd_str = 'python -u main.py {} -kv "{}"'.format(fpath, kv)

    shell.bash(cmd_str)
    return

def main(args):
    # set default directory name to the time when run the experiment
    if args.dir == '':
        args.dir = Timer.get_time(fmt = '%m_%d_%H_%M')
    directory = './{}'.format(args.dir)
    # no any results saved in test mode
    if args.test:
        directory = ''

    if os.path.isfile(args.path):
        run_experiment(args.path, directory, args.kv)
    else:
        # an indicator for using sub dir when run multiple
        if directory != '':
            directory += '/'
        config_files = glob.glob('{}/*.ini'.format(args.path))
        config_files.sort()
        for item in config_files:
            run_experiment(item, directory, args.kv)
    return


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description = "Schedule script to run multiple experiments at one command", \
                formatter_class=argparse.ArgumentDefaultsHelpFormatter)

    parser.add_argument('path', type=str, help = "A path to directory of config files or a single config file")
    parser.add_argument('-dir', type=str, help = "directory name for save results", default = '')
    parser.add_argument('-kv',  type=str, help = "Overwrites the default options", default = '')
    parser.add_argument('-test', dest = 'test', action = 'store_true', help = 'Enable test mode')
    args = parser.parse_args()
    main(args)
