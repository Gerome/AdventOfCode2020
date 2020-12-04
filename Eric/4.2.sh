# expecting 184
: '
byr (Birth Year) - four digits; at least 1920 and at most 2002.
iyr (Issue Year) - four digits; at least 2010 and at most 2020.
eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
hgt (Height) - a number followed by either cm or in:
If cm, the number must be at least 150 and at most 193.
If in, the number must be at least 59 and at most 76.
hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
pid (Passport ID) - a nine-digit number, including leading zeroes.
cid (Country ID) - ignored, missing or not.
';

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