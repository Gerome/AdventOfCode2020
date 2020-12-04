# expecting 184

IFS=- z=($(awk '{print "-",$0}' RS= i/4))
for p in ${z[@]}
{ 
  IFS=' ' read -a y<<<${p//$'\n'/ }
  k=0
  for x in ${y[@]}
  {
    w=${x::3}
    v=${x:4}
    case $w in
      "byr")k=$[k+(v>1919&&v<2003)];;
      "iyr")k=$[k+(v>2009&&v<2021)];;
      "eyr")k=$[k+(v>2019&&v<2031)];;
      "hgt")h=${v::$[${#v}-2]}
        case ${v: -2} in
        "cm")k=$[k+(h>149&&h<194)];;
        "in")k=$[k+(h>58&&h<77)];;
        esac;;
      "hcl")[[
        ${v:1} =~ ^[0-9a-f]{6}$
        ]]&&((k++));;
      "ecl")[[
        "ambblubrngrygrnhzloth" = *$v*
        ]]&&((k++));;
      "pid")[[
        $v =~ ^[0-9]{9}$
        ]]&&((k++))
    esac
  }
  ((k>6))&&((t++))
}
echo $t