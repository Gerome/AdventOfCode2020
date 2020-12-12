# expecting 364
IFS=$'\n' l=($(<i/12))
d=E

q(){
  case $u in
    -1)d=S;;
    -2)d=W;;
    -3)d=N;;
    0)d=E;;
    1)d=N;;
    2)d=W;;
    3)d=S
  esac
}

c(){
  case $1 in
  N)
  n=$[n+$2];;
  E)
  e=$[e+$2];;
  S)
  n=$[n-$2];;
  W)
  e=$[e-$2];;
  R)
  a=$[a-$2]
  u=$[(a/90)%4]
  q
  ;;
  L)
  a=$[a+$2]
  u=$[(a/90)%4]
  q
  ;;
  esac
}

for p in ${l[@]}
do
  o=${p::1}
  b=${p:1}
  case $o in
  F)c $d $b;;
  *)c $o $b
  esac
done
echo $[${e#-}+${n#-}]
