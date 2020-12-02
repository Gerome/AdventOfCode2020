

with open("input.txt", "r") as f:
    input = f.read()

count = 0
for instance in input.split('\n'):
    if not instance:
        continue
    index1 = int(instance.split('-')[0]) - 1
    index2 = int(instance.split('-')[1].split()[0]) - 1
    letter = instance.split('-')[1].split()[1][0]
    password = instance.split('-')[1].split()[2]

    if (password[index1] == letter and password[index2] != letter) or (password[index1] != letter and password[index2] == letter):
        count += 1

print(count)


d=input

c=0
for v in d.split('\n')[:-1]:
    f=v.split('-')
    i=int(f[0])-1
    j=int(f[1].split()[0])-1
    g=v.split()
    l=g[1][0]
    p=g[2]
    if(p[i]==l)^(p[j]==l):c+=1

print(c)