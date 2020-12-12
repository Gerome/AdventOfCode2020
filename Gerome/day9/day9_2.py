from itertools import combinations

input_lines = open("input.txt","r").readlines()
invalid_value = 257342611

def get_value():
    for i in range(1, 1001):
        current_hold = []

        for line in input_lines:
            value = int(line)

            if len(current_hold) >= i:
                sum_of_vals = sum(current_hold)

                if sum_of_vals == invalid_value:
                    print(min(current_hold) + max(current_hold))
                    return

                current_hold.pop(0)
            current_hold.append(value)

get_value()