


def hit_trees(horiz, vert):
    horizontal_index = 0
    vertical_index = 0
    tree = '#'
    c = 0
    skip_level=False
    for line in open("input.txt", "r").readlines():
        if skip_level:
            skip_level = not skip_level
            continue

        if vert==2:
            if skip_level: skip_level = not skip_level
            else: skip_level = True

        line = line.replace('\n', '')
        line_length = len(line)
        if (line[horizontal_index % line_length] == tree): c += 1
        horizontal_index += horiz
    print(c)
    return c

right_movements = [1, 3, 5, 7, 1]
down_movement = [1, 1, 1, 1, 2]

total = 1

for y in [hit_trees(horiz, vert) for horiz, vert in zip(right_movements, down_movement)]:
    total *= y

print(total)