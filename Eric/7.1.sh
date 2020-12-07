# expecting 229
total=0
counted_bags=()

find_colour() {
  IFS=$'\n' l=($(<i/7))
  for x in ${l[@]}
  { 
    IFS=' '
    s=($x)
    name="${s[0]}${s[1]}"
    #echo $name

    for (( j=4; j<${#s[@]}; j=$[j+4] ))
    {
      within_name="${s[$j+1]}${s[$j+2]}"
      if [[ "$within_name" == $1 ]]
      then
        if ! [[ ${counted_bags[*]} =~ "$name" ]]
        then
          counted_bags+=($name)
          ((total++))
          find_colour $name
        fi
      fi
    }
  }
}

find_colour "shinygold"
echo $total
