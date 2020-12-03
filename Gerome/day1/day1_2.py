from itertools import combinations
print([input1*input2*input3 for input1, input2, input3 in list(combinations(open("a", "r").readlines(), 3)) if input1 + input2 + input3 == 2020])