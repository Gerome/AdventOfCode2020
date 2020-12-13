import math
from itertools import groupby
from operator import itemgetter

input_lines = open("input.txt", "r").read()

split_lines = input_lines.split('\n')
split_lines = [int(i) for i in split_lines if i]
split_lines = sorted(split_lines)


def do_thing(remaining_values):
    x = [list(map(itemgetter(1), g)) for k, g in groupby(enumerate(remaining_values), lambda x: x[0]-x[1])]
    y = [len(i) for i in x if len(i) > 2]
    z = []
    for i in y:
        if i == 5:
            z.append(7)
        else:
            z.append(2**(i-2))
    return z

split_lines.insert(0, 0)
split_lines.append(split_lines[-1]+3)
print(math.prod(do_thing(split_lines)))