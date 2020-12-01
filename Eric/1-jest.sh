# expecting 262738554
# tests 3 random values forever until it finds the correct bunch
# 1 char shorter than the real answer
IFS=$'\n' command eval 'z=(`<./i/1`)';f(){ r=${z[$RANDOM % ${#z[@]}]};};for((;;));{ f;a=$r;f;b=$r;f;c=$r;if((a+b+c==2020));then echo $[a*b*c];exit;fi;}