from __future__ import print_function
import sys, os, argparse
import numpy as np
from pdb import set_trace

LOGMASS_STAT = 4

def print_array(X, row_break = 0, break_size = 1):
    print('--'*30)
    for i, row in enumerate(X):
        print(','.join(row.astype(str)))
        if row_break > 0 and (i+1) % row_break == 0:
            print('\n'*break_size, end = '')
    return


def parse_rmse(f):
    with open(f) as fh:
        content = fh.readlines()

    ret = []
    flag = 0 # marks if we are in the final results section
    for line in content:
        if not flag:
            tmp = [item in line for item in ['Setting', 'Query:', 'Missing:']]
            flag = sum(tmp) == 3

        if flag:
            tokens = line.strip().split(' ')
            if len(tokens) == 2:
                try:
                    v = float(tokens[1])
                except:
                    print('Passing failed: {}'.format(line), end = '')
                ret.append(v)
    return ret


def parse_logmass(f):
    with open(f) as fh:
        content = fh.readlines()

    ret = []
    for line in content:
        if 'logmass:' in line:
            tmp = line.strip().split(':')
            tokens = tmp[1].strip().split(' ')
            if len(tokens) == (2*LOGMASS_STAT):
                values = tokens[slice(1,None,2)]
                try:
                    for v in values:
                        v = float(v)
                        ret.append(v)
                except:
                    print('Passing failed: {}'.format(line), end = '')
    ret = np.array(ret)
    ret = ret.reshape(-1,LOGMASS_STAT)
    return ret


def find_result_files(directory):
    ret = []
    for r,d,F in os.walk(directory):
        for f in F:
            if f.endswith('.res'):
                fpath = '{}/{}'.format(r,f)
                ret.append(fpath)
    return ret


def main(args):
    files = []
    for item in args.paths:
        if os.path.isfile(item):
            files.append(item)
        else:
            files.extend(find_result_files(item))

    files.sort()
    print(files)

    rmse = np.array([parse_rmse(f) for f in files])
    print_array(rmse.T, args.rb, args.rbs)

    logmass = np.array([parse_logmass(f) for f in files])
    for i in range(LOGMASS_STAT):
        print_array(logmass[:,:,i].T)



if __name__ == '__main__':
    parser = argparse.ArgumentParser(description = "Extract results from console output", formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('paths', type = str, help = "Paths to input directory or files", nargs = '+')
    parser.add_argument('-rb', type = int, help = "Row break when printing", default = 0)
    parser.add_argument('-rbs', type = int, help = "Row break size, only effective if rb is > 0", default = 1)
    args = parser.parse_args()
    main(args)

