# expecting 646

IFS=$'\n' l=($(<i/5))
for s in ${l[@]}
{ 
  s=${s//[BR]/1}
  s=${s//[FL]/0}
  y+=($[2#$s])
}
y=($(printf "%s\n" ${y[@]}|sort))
for i in ${!y[@]}
{
  q=${y[i++]}
  for((;y[i]-q>1;q++))
  { 
    echo $[q+1]
  }
}