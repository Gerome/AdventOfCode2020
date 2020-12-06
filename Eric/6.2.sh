# expecting 3445
# laughably slow again

IFS=- z=($(awk '{print "-",$0}' RS= i/6))
for p in ${z[@]}
{
  IFS=- g=(${p//$'\n'/-})
  u=()
  for m in ${g[@]}
  {
    m=${m// /}
    for((i=0;i<${#m};i++))
    {
      ((u[$(printf '%d' "'${m:i}")]++))
    }
  }

  for l in ${u[@]}
  {
    ((${#g[@]}==l&&q++))
  }
}

echo $q
