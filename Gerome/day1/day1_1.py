from itertools import combinations
print([(input1, input2) for input1, input2 in list(combinations(open("a", "r").readlines(), 2)) if input1 + input2 == 2020][0])