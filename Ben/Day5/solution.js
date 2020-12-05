i=require('fs').readFileSync('i','utf8').replace(/L|F/g,'0').replace(/R|B/g,'1').split(/\r?\n/)
i=i.map(bp =>8*parseInt(bp.slice(0,7),2)+parseInt(bp.slice(7),2)).sort((a,b)=>a-b)
c=console.log
// Part 1
c(i[i.length-1])
// Part 2
for(x=0;x<i.length;x++){
    if (i[x]+1<i[x+1])
        c(i[x]+1)
}