

with open("input.txt", "r") as f:
    input = f.read().split('\n')

count = 0
for instance in input:
    if not instance:
        continue
    min_occurrences = int(instance.split('-')[0])
    max_occurrences = int(instance.split('-')[1].split()[0])
    letter = instance.split('-')[1].split()[1][0]
    password = instance.split('-')[1].split()[2]
    if min_occurrences <= password.count(letter) <= max_occurrences:
        count += 1

print(count)
