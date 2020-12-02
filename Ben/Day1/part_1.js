var fs = require('fs');
var lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/).map(Number);

lines.forEach(i => {
    lines.forEach(j => {
        if (i + j == 2020) { 
            console.log(i * j);
            process.exit(1);
        }
    })
});