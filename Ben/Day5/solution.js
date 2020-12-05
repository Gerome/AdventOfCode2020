i=require('fs').readFileSync('i','utf8').replace(/L|F/g,'0').replace(/R|B/g,'1').split(/\r?\n/)
n=(a=>("0b"+a)-0)
i=i.map(p =>8*n(p.slice(0,7))+n(p.slice(7))).sort((a,b)=>a-b)
c=console.log
// Part 1
c(i[i.length-1])
// Part 2
for(x=0;x<i.length;x++){
    o=i[x]+1
    if (o<i[x+1])
        c(o)
}
