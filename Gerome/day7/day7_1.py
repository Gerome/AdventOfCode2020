from copy import copy

data = open("input.txt","r").readlines()

blue = []
black = []
olive = [blue, blue, blue, black, black, black, black]
plum = [blue, blue, blue, blue, blue, black, black, black, black, black, black]

gold = [olive, plum, plum]
white= [gold]
yellow = [gold, gold, blue, blue, blue, blue, blue, blue, blue, blue, blue]
red = [white, yellow, yellow]
# dark_orange_bag = 3 bright white bags, 4 muted yellow bags

c=0
bags = ['shiny gold']
for line in data:
    if bags[0] in line:

        desc_colour = f"{line.split()[:2][0]} {line.split()[:2][1]}"
        bags.append(desc_colour)


new_bags = copy(list(set(bags)))
for line in data:
    if any(x in line for x in bags):

        desc_colour = f"{line.split()[:2][0]} {line.split()[:2][1]}"
        new_bags.append(desc_colour)
new_bags = copy(list(set(new_bags)))
print(len(new_bags))
c+=1

print(c)