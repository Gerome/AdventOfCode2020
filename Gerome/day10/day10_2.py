
input_lines = open("input.txt", "r").read()

split_lines = input_lines.split('\n')
split_lines = [int(i) for i in split_lines if i]
split_lines = sorted(split_lines)


def do_thing(current_number, remaining_values, total_count):
    numbers_within_limit = [value for value in remaining_values if current_number < value <= current_number + 3]

    for value in numbers_within_limit:
        list_copy = remaining_values[remaining_values.index(value)+1:]

        if not list_copy:
            total_count += 1
            return total_count

        total_count = do_thing(value, list_copy, total_count)

    return total_count



do_thing(0, split_lines, 0)