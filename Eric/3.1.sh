# 3.1, like windows?
# expects 145
x=1;IFS=$'\n' l=($(<i/3));l=${l:1:};for j in ${l[@]};{ n=${#j};x=$[x+3];i=$[x%n];((i--));[[ "${j:$i:1}" = "#" ]]&&((t++)); };echo $t