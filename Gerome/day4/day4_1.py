
required_values = ['byr','iyr','eyr','hgt','hcl','ecl','pid']


data =  open("input.txt","r").read()
c = 0
z = data.split('\n\n')
for z in data.split('\n\n'):
    x = z.replace('\n', ' ')
    y = x.split()
    fields = [i.split(':')[0] for i in y]
    print(fields)
    if len(list(set(fields) & set(required_values)))==7:
        c+=1

print(c)