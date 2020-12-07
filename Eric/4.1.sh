# expecting 254
IFS=- z=($(awk '{print "-",$0}' RS= i/4))
for p in "${z[@]}"
{ 
  IFS=' ' read -a y<<<${p//$'\n'/ }
  c=0
  for x in ${y[@]}
  {
    [[
      byriyreyrhgthcleclpid = *${x::3}*
    ]]&&((c++))
  }
  ((c>6))&&((t++))
}
echo $t