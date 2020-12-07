# expecting 6683
total=0

find_colour() {
  IFS=$'\n' l=($(<i/7))
  for x in ${l[@]}
  { 
    IFS=' '
    local s=($x)
    local name="${s[0]}${s[1]}"
    local j=4

    if [[ "$name" == $2 ]]
    then
      for ((; j<${#s[@]}; j=$[j+4] ))
      {
          local within_name="${s[$j+1]}${s[$j+2]}"
          if [[ "${s[$j]}" != "no" ]]
          then
            local m=$1
            local n=${s[$j]}
            local lt=$[n * m]
            local nm
            total=$[total + lt]
            echo "we have $n $within_name bags inside $1 $name, that's $lt, making $total"
            find_colour $lt $within_name
          else
            echo "-----"
          fi
      }
    fi

  }
}

find_colour 1 "shinygold"
echo $total
