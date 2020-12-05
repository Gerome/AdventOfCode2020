i=require('fs').readFileSync('i','utf8').replace(/L|F/g,0).replace(/R|B/g,1).split(/\r?\n/)
n=(a=>("0b"+a)-0)
i=i.map(p =>8*n(p.slice(0,7))+n(p.slice(7))).sort((a,b)=>a-b)
console.log(i[i.length-1]+"\n"+(i.filter((a,b)=>a+1<i[b+1])[0]+1))