from itertools import combinations

input_lines = open("input.txt","r").readlines()

current_hold = []
for line in input_lines:

    value = int(line)

    if len(current_hold) >= 25:
        sum_valid = False
        for val1, val2 in list(combinations(current_hold, 2)):
            if val1 + val2 == value:
                sum_valid = True
        if not sum_valid:
            print(value)
            break
        current_hold.pop(0)

    current_hold.append(value)
