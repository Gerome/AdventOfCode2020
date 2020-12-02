from itertools import combinations
from day1.day1_1 import inputs
print([input1*input2*input3 for input1, input2, input3 in list(combinations(inputs, 3)) if input1 + input2 + input3 == 2020])