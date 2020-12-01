from itertools import combinations

from day1_1 import inputs

sum_pairs = [(input1, input2, input3) for input1, input2, input3 in list(combinations(inputs, 3)) if input1 + input2 + input3 == 2020]
print(sum_pairs)