# expecting 441
IFS=$'\n' command eval 'z=(`<i/2`)';for p in "${z[@]}";{ IFS=-;n=($p);IFS=' ';b=(${n[1]});l=${b[1]::1};u=0;[[ ${b[2]:$[n-1]:1} = $l ]]&&((u++));[[ ${b[2]:$[b-1]:1} = $l ]]&&((u++));for((;u&&u<2;i++)){ u=0;} };echo $i