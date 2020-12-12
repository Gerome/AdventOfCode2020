# expecting 364
IFS=$'\n' l=($(<i/12))
e=0
n=0
angle=0
curdir=E
curp=0

curptodir(){
  case "$curp" in
    -1) curdir=S;;
    -2) curdir=W;;
    -3) curdir=N;;
    0) curdir=E;;
    1) curdir=N;;
    2) curdir=W;;
    3) curdir=S;;
  esac
}

calc(){
  case "$1" in
  N) echo "moves north $2"
  n=$[n + $2];;
  E) echo "moves east $2"
  e=$[e + $2];;
  S) echo "moves south $2"
  n=$[n - $2];;
  W) echo "moves west $2"
  e=$[e - $2];;
  R) echo "turns right $2"
  angle=$[angle - $2]
  curp=$[(angle/90) % 4]
  curptodir
  echo "Now at $angle degrees, curp at $curp, dir at $curdir"
  ;;
  L) echo "turns left $2"
  angle=$[angle + $2]
  curp=$[(angle/90) % 4]
  curptodir
  echo "Now at $angle degrees, curp at $curp, dir at $curdir"
  ;;
  esac
}

for p in ${l[@]};
do
  echo $p
  direction=${p::1}
  units=${p:1}

  case $direction in
  F) calc $curdir $units;;
  *) calc $direction $units
  esac

done

abse=${e#-}
absn=${n#-}
sum=$[abse + absn]
echo "$abse + $absn = $sum"