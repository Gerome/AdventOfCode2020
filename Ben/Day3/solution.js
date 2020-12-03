var i=require('fs').readFileSync('i','utf8').split(/\r?\n/);
let r=(s)=>(s.map(n=>{
    for([xi,yi]=n,x=y=c=0;y+yi<i.length;i[y+=yi][x=(x+xi)%i[y].length]==='#'?c++:0);
    return c
}).reduce((a,c)=>a*c));
console.log(r([[3,1]])+"\n"+r([[1,1],[3,1],[5,1],[7,1],[1,2]]))
