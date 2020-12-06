# expecting 974

IFS=$'\n' l=($(<i/5))
for s in ${l[@]}
{ 
  s=${s//[BR]/1}
  s=${s//[FL]/0}
  i=$[2#$s]
  ((i>m))&&m=$i
}
echo $m