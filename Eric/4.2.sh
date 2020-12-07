# expecting 184

IFS=- z=($(awk '{print "-",$0}' RS= i/4))
for p in ${z[@]}
{ 
  IFS=' ' read -a y<<<${p//$'\n'/ }
  k=0
  for x in ${y[@]}
  {
    w=${x::2}
    v=${x:4}
    a=0
    case $w in
      by)k=$[k+(v>1919&&v<2003)];;
      iy)k=$[k+(v>2009&&v<2021)];;
      ey)k=$[k+(v>2019&&v<2031)];;
      hg)h=${v::$[${#v}-2]}
        case ${v: -1} in
        m)k=$[k+(h>149&&h<194)];;
        n)k=$[k+(h>58&&h<77)]
        esac;;
      hc)[[
        ${v:1} =~ ^[0-9a-f]{6}$
        ]]&&((k++));;
      ec)[[
        ambblubrngrygrnhzloth = *$v*
        ]]&&((k++));;
      pi)[[
        $v =~ ^[0-9]{9}$
        ]]&&((k++))
    esac
  }
  ((k>6))&&((t++))
}
echo $t