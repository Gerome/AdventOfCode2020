# expects 3424528800
t=0
x=1
IFS=$'\n' l=($(<i/3))
l=${l:1:}
q=(1 7 5 3 1)
f=1
j=0
for s in ${q[@]}
{ 
y=0
t=0
x=1
for line in ${l[@]}
{((y++))
((f&&y%2))&&continue
n=${#line}
x=$[x+s]
i=$[x%n]
((i--))
[[ 
  ${line:$i:1} = "#"
   ]]&&((t++))
}
k[$j]=$t
f=0
((j++))
}
echo $[k[0]*k[1]*k[2]*k[3]*k[4]]