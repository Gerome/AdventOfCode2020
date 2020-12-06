data = open("input.txt","r").read()

c = 0
for line in data.split('\n\n'):
    whole_line = line.replace('\n', '')
    c+=len(set(whole_line))
print(c)
