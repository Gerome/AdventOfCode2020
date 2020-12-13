# expecting 3035
IFS=$'\n' l=($(<i/13))
a=${l[0]}
IFS=, buses=(${l[@]:1})

for bus in ${buses[@]}
do
  time=0
  [[ $bus != "x" ]]&&{
    for ((;time<a;))
    {
      time=$[time+bus]
    }
    ((low<a))||((time<low))&&{
      low=$time
      cbus=$bus
    }
  }
done

echo $[(low-a)*cbus]
