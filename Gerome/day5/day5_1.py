def get_seat_number(line, one_value):
    binary = ""
    for letter in line:
        binary += '1' if letter == one_value else '0'

    return int(binary, 2)

x=[]
for line in open("input.txt","r").readlines():
    line = line.strip()
    seat_number = get_seat_number(line[:-3], 'B')
    seat_column = get_seat_number(line[-3:], 'R')
    id = seat_number*8+seat_column
    x.append(id)

print(max(x))