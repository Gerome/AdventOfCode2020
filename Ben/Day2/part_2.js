var fs = require('fs');

// Make sure we got a filename on the command line.
if (process.argv.length < 3) {
    console.log('Usage: node ' + process.argv[1] + ' FILENAME');
    process.exit(1);
}

var lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/);

console.log(lines.filter(line => {
    let split = line.split(" ");
    let c = split[1].replace(":","");
    let [l, u] = split[0].split("-");
    if (split[2][l - 1] === c ^ split[2][u - 1] === c)
        return true;
}).length);