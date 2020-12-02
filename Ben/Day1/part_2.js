var fs = require('fs');
var lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/).map(Number);

lines.forEach(i => {
    lines.forEach(j => {
        lines.forEach(k => {
            if (i + j + k == 2020) { 
                console.log(i * j * k);
                process.exit(1);
            }
        })
    })
});