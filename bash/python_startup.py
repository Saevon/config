from __future__ import print_function

try:
    from folder_list import *
except ImportError as error:
    print("Can't import FolderList: {}".format(error))
else:
    root = FolderList('.')


import subprocess
def pbcopy(output):
    process = subprocess.Popen(
        'pbcopy', env={'LANG': 'en_US.UTF-8'}, stdin=subprocess.PIPE
    )
    process.communicate(output.encode('utf-8'))



import math
def nCr(n,r):
    f = math.factorial
    return f(n) / f(r) / f(n-r)


def min_one(percent, shots):
    probability = 0
    for i in range(1, shots + 1):
        probability += nCr(shots, i)*math.pow(percent, i)*math.pow(1 - percent, shots - i)

    return probability
