var i = require('fs').readFileSync('i', 'utf8').split(/\r?\n/);
let rf = (starts) => (starts.map(s => {
    for([xi, yi]=s,x=y=c=0;y+yi<i.length;i[y+=yi][x = (x + xi) % i[y].length] === '#'?c++:0);
    return c;
}).reduce((a, c) => a * c));
console.log(rf([[3,1]]) + "\n" + rf([[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]))
