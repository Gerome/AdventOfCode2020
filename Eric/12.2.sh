# expecting 39518
# could be better
IFS=$'\n' l=($(<i/12))
x=10
y=1
te=1
tn=-1

r(){
  q=$x
  x=$[te*y]
  y=$[tn*q]
}

l(){
  q=$x
  x=$[tn*y]
  y=$[te*q]
}

c(){
  t=$2
  t=${t#-}
  case $1 in
  N)y=$[y+$2];;
  E)x=$[x+$2];;
  S)y=$[y-$2];;
  W)x=$[x-$2];;
  R)
    while((t))
    do
      t=$[t-90]
      r
    done
  ;;
  L)
    while((t))
    do
      t=$[t-90]
      l
    done
  esac
}

for p in ${l[@]}
do
  d=${p::1}
  u=${p:1}
  case $d in
  F)
  e=$[e+(u*x)] 
  n=$[n+(u*y)] 
  ;;
  *)c $d $u
  esac
done
echo $[${e#-}+${n#-}]
