from itertools import combinations

from day1_1 import inputs

sum_pairs = []
for input1, input2, input3 in list(combinations(inputs, 3)):
    if (input1 + input2 + input3) == 2020:
        sum_pairs.append((input1, input2, input3))

print(sum_pairs)