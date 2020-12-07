# expecting 229
f() {
  IFS=$'\n' 
  l=($(<i/7))
  for x in ${l[@]}
  { 
    IFS=' '
    s=($x)
    n="${s[0]}${s[1]}"
    for ((j=4;j<${#s[@]};j=j+4))
    {
      [ "${s[$j+1]}${s[$j+2]}" == $1 ]&&! [[ ${c[*]} =~ $n ]]&&{
          c+=($n)
          ((t++))
          f $n
      }
    }
  }
}
f shinygold
echo $t
