data = open("input.txt","r").readlines()



first_run = True
already_visited = []

accumulator = 0
index = 0
while(first_run):
    instruction = data[index].split()[0]
    amount = int(data[index].split()[1])

    if instruction == 'acc':
        accumulator += amount
        index+=1

    elif instruction == 'jmp':
        index += amount

    elif instruction == 'nop':
        index += 1

    first_run = index not in already_visited
    already_visited.append(index)

print(accumulator)
