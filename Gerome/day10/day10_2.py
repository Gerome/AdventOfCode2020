import math

input_lines = open("input.txt", "r").read()

split_lines = input_lines.split('\n')
split_lines = [int(i) for i in split_lines if i]
split_lines = sorted(split_lines)


def do_thing(current_number, remaining_values):

    numbers_within_limit = [value for value in remaining_values if current_number < value <= current_number + 3]

    values_list = []

    while numbers_within_limit[-1] != remaining_values[-1]:
        list_length = len(numbers_within_limit)

        if list_length > 1:
            values_list.append(2**(list_length-2))

        current_number = numbers_within_limit[-1]
        remaining_values = remaining_values[remaining_values.index(current_number) + 1:]
        numbers_within_limit = [value for value in remaining_values if current_number < value <= current_number + 3]

    return values_list

print(split_lines)
result = do_thing(0, split_lines)
print(result)
print(math.prod(result))