from copy import copy



def instructions_finished(input_data):
    first_run = True
    already_visited = []

    accumulator = 0
    index = 0

    while(first_run):
        instruction = input_data[index].split()[0]
        amount = int(input_data[index].split()[1])

        if instruction == 'acc':
            accumulator += amount
            index+=1

        elif instruction == 'jmp':
            index += amount

        elif instruction == 'nop':
            index += 1

        first_run = index not in already_visited
        already_visited.append(index)


        program_finished = index == len(data)

        if program_finished:
            print(accumulator)
            return True


    return False

changeable_indeces = []

data = open("input.txt","r").readlines()

for i in range(len(data)):
    line = data[i]
    instruction = line.split()[0]
    amount = int(line.split()[1])
    if (instruction == 'jmp') or (instruction == 'nop' and amount != 0):
        changeable_indeces.append(i)


for index in changeable_indeces:
    line = data[index]

    instruction = line.split()[0]
    amount = line.split()[1]

    instruction_after = 'jmp' if instruction == 'nop' else 'nop'
    data_copy = copy(data)
    data_copy[index] = instruction_after + ' ' + amount

    if instructions_finished(data_copy):
        break

