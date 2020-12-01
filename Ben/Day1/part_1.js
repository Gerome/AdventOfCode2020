var fs = require('fs');

// Make sure we got a filename on the command line.
if (process.argv.length < 3) {
    console.log('Usage: node ' + process.argv[1] + ' FILENAME');
    process.exit(1);
}

var lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/).map(Number);

lines.forEach(i => {
    lines.forEach(j => {
        if (i + j == 2020) { 
            console.log(i * j);
            process.exit(1);
        }
    })
});