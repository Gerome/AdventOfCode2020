data = open("input.txt","r").read()

c = 0
for line in data.split('\n\n'):
    line_set = [set(x) for x in line.split('\n') if x]
    common_chars = set.intersection(*line_set)
    c += len(common_chars)
print(c)
