with open("input.txt", "r") as f:
    d = f.read()

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