var fs = require('fs');
var lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/);

function getParts(line) {
    let split = line.split(" ");
    let c = split[1].replace(":","");
    let [l, u] = split[0].split("-");
    let p = split[2];
    return [c, l, u, p];
}

console.log(lines.filter(line => {
    let [c, l, u, p] = getParts(line);
    let o = (p.match(new RegExp(c,"g")) || []).length;
    if (o >= l && o <= u)
            return true;
}).length);

console.log(lines.filter(line => {
    let [c, l, u, p] = getParts(line);
    if (p[l - 1] === c ^ p[u - 1] === c)
        return true;
}).length);
