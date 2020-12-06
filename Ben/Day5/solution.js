i=require('fs').readFileSync('i','utf8').replace(/L|F/g,0).replace(/R|B/g,1).split(/\r?\n/)
i=i.map(p =>+("0b"+p)).sort((a,b)=>a-b)
console.log(i.pop()+"\n"+(i.find((a,b)=>a+1<i[b+1])+1))
