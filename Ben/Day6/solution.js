i=require('fs').readFileSync('i','utf8').split(/\r?\n\r?\n/g)
i=i.map(g=>{
    c=[0,0]
    for(n=0;n<26;n++){
        l=g.split("").filter(a=>a==String.fromCharCode(97+n)).length;   
        l?c[0]++:c
        l==g.split(/\r?\n/).length?c[1]++:c
    }
    return c
}).reduce((r,a)=>a.map((b,i)=>(r[i]||0)+b),[])
console.log(i[0]+"\n"+i[1])
