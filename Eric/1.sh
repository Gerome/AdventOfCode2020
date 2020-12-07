# expecting 262738554
IFS=$'\n' z=($(<i/1))
for i in ${z[@]}
{ for j in ${z[@]}
{ for k in ${z[@]}
{ ((i+j+k==2020))&&{
echo $[i*j*k]
exit
}
}
}
}