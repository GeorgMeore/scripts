#!/usr/bin/python
# Simple matplotlib wrapper for quick plotting.

import sys
import argparse
import matplotlib.pyplot as plt


# parse cli arguments
def getargs():
    parser = argparse.ArgumentParser(description='Draw a graph.')
    parser.add_argument('-f',
        help='line format',
        dest='format',
        default='o')
    args = parser.parse_args()
    return args


# read points from stdin
def getxy():
    x, y = [], []
    for row in map(str.split, filter(lambda l: len(l) > 0 and l[0] != '#', sys.stdin)):
        if len(row) < 2:
            continue
        x.append(float(row[0]))
        y.append(float(row[1]))
    return x, y


# plot points
def plot(x, y, format):
    plt.plot(x, y, format)
    plt.grid(linestyle='--')
    plt.show()


if __name__ == '__main__':
    args = getargs()
    x, y = getxy()
    plot(x, y, args.format)
