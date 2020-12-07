# expecting 6683
f() {
  IFS=$'\n' l=($(<i/7))
  for x in ${l[@]}
  { 
    IFS=' '
    local s=($x)
    [ "${s[0]}${s[1]}" == $2 ]&&{
      local j=0
      for ((j=4;j<${#s[@]};j=j+4))
      {
          [ ${s[$j]} != no ]&&{
            local l=$[s[$j]*$1]
            t=$[t+l]
            f $l "${s[$j+1]}${s[$j+2]}"
          }
      }
    }
  }
}

f 1 shinygold
echo $t
