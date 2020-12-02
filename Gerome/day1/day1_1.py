from itertools import combinations

with open("input.txt", "r") as f:
    inputs = f.read()

sum_pairs = [(input1, input2) for input1, input2 in list(combinations(inputs, 2)) if input1 + input2 == 2020]
print("i've got a pecker")
