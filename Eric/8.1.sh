# expecting 1797
rs=()
t=0
IFS=$'\n' l=($(<i/8))

line(){
  ((rs[$1]++ < 1))&&{
    
    x=${l[$1]}
    o=${x::3}
    s=${x:4:1}
    a=${x:5}

    case $o in 
    acc) eval "t=\$[$t ${s} $a]";;
    jmp) eval "n=\$[$1 ${s} $a]"
    line $n
    return 0;;
    esac
    ((next < ${#l[@]}))&&{
      next=$[$1+1]
      line $next
    }
  }
}

line 0
echo $t