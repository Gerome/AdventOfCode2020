# expecting 6748
# golfing made this laughably slow

IFS=- z=($(awk '{print "-",$0}' RS= i/6))
for p in ${z[@]}
{ 
  p=${p//$'\n'/}
  u=()
  for((i=1;i<${#p};i++))
  {
    ((u[$(printf '%d' "'${p:i}")]++))
  }
  t=$[t+${#u[@]}]
}
echo $t

