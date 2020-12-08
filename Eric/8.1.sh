# expecting 1797
IFS=$'\n' l=($(<i/8))
f(){
  ((q[$1]++<1))&&{
    x=${l[$1]}
    o=${x::3}
    a=${x:4}
    case $o in 
    acc)eval "t=\$[$t$a]";;
    jmp)eval "n=\$[$1$a]"
    f $n
    return
    esac
    f $[$1+1]
  }
}
f 0
echo $t