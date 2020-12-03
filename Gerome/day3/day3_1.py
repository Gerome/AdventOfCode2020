
right_movement = 3
horizontal_index = 0
tree = '#'
c=0
for line in open("input.txt","r").readlines():
    line = line.replace('\n', '')
    line_length = len(line)
    if(line[horizontal_index%line_length]==tree):c+=1
    horizontal_index+=right_movement
print(c)