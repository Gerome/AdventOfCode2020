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
    let l = split[0].split("-")[0];
    let u = split[0].split("-")[1];
    let o = (split[2].match(new RegExp(c,"g")) || []).length;
    if (o >= l && o <= u)
            return true;
}).length);