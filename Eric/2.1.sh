# expecting 467
IFS=$'\n' z=($(<i/2))
for p in "${z[@]}"
{ IFS=-
n=($p)
IFS=' '
b=(${n[1]})
l=${b[1]::1}
c=${p//[^$l]}
c=${#c}-1
for((;c>=n&&c<=b[0];i++)){ c=0
 } }
 echo $i