

with open("input.txt", "r") as f:
    input = f.read().split('\n')

count = 0
for instance in input:
    if not instance:
        continue
    index1 = int(instance.split('-')[0]) - 1
    index2 = int(instance.split('-')[1].split()[0]) - 1
    letter = instance.split('-')[1].split()[1][0]
    password = instance.split('-')[1].split()[2]

    if (password[index1] == letter and password[index2] != letter) or (password[index1] != letter and password[index2] == letter):
        count += 1

print(count)
