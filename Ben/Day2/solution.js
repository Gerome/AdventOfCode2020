var fs = require('fs');
var lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/);

let [p1,p2] = [0,0];
lines.forEach(line => {
    let [r,c,p] = line.split(" ");
    c = c.replace(":", "");
    let [l, u] = r.split("-");
    let o = (p.match(new RegExp(c, "g")) || []).length;
    if (o >= l && o <= u)
        p1++;
    if (p[l - 1] === c ^ p[u - 1] === c)
        p2++;
})

console.log(`${p1}\n${p2}`)
