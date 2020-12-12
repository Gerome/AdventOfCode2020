# expecting 39518
IFS=$'\n' l=($(<i/12))
wpe=10
wpn=1
wpangle=0
wpcurdir=E
wpcurp=0

e=0
n=0

tge=1
tgn=-1


right(){
  abswpe=${wpe#-}
  abswpn=${wpn#-}
  
  # right 90
  owpe=$wpe
  wpe=$[tge * wpn]
  wpn=$[tgn * owpe]
}

left(){
  abswpe=${wpe#-}
  abswpn=${wpn#-}
  
  # right 90
  owpe=$wpe
  wpe=$[tgn * wpn]
  wpn=$[tge * owpe]
}

calc(){
  case "$1" in
  N) echo "wp moves north $2"
  wpn=$[wpn + $2];;
  E) echo "wp moves east $2"
  wpe=$[wpe + $2];;
  S) echo "wp moves south $2"
  wpn=$[wpn - $2];;
  W) echo "wp moves west $2"
  wpe=$[wpe - $2];;
  R) echo "wp turns right $2"
    t=$2
    abst=${t#-}
    while((abst>0)); do
      abst=$[abst - 90]
      right
    done
    echo "wp now at e $wpe / n $wpn"
  ;;
  L) echo "turns left $2"
    t=$2
    abst=${t#-}
    while((abst>0)); do
      abst=$[abst - 90]
      left
    done
    echo "wp now at e $wpe / n $wpn"
  # .. 
  ;;
  esac
}

for p in ${l[@]};
do
  echo $p
  direction=${p::1}
  units=${p:1}

  case $direction in
  F) 
  e=$[e + (units * wpe)] 
  n=$[n + (units * wpn)] 
  ;;
  *) calc $direction $units
  esac

  echo "dir: $direction, units: $units"
  echo "Ship at $e, $n, wp at e $wpe / n $wpn"
  echo

done


abse=${e#-}
absn=${n#-}
sum=$[abse + absn]
echo "$abse + $absn = $sum"