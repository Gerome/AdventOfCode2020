# expecting 3035
IFS=$'\n' l=($(<i/13))
a=${l[0]}
IFS=, b=(${l[@]:1})
for x in ${b[@]}
do
  t=0
  [[ $x != "x" ]]&&{
    for((;t<a;))
    {
      t=$[t+x]
    }
    ((w<a))||((t<w))&&{
      w=$t
      c=$x
    }
  }
done
echo $[(w-a)*c]
