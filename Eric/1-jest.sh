# expecting 262738554
# tests 3 random values forever until it finds the correct bunch
# much shorter than the real answer
IFS=$'\n' command eval 'z=(`<./i/1`)';f(){ r=${z[$RANDOM%${#z[@]}]};};for((;$[a+b+c]!=2020;));{ f;a=$r;f;b=$r;f;c=$r;};echo $[a*b*c]