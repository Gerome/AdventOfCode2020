var fs = require('fs');
var lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/).map(Number);

lines.some(i => {
    if(lines.some(j => {
        if (i + j == 2020) { 
            console.log(i * j);
            return true;
        }
    })) return true;
});

lines.some(i => {
    if(lines.some(j => {
       if(lines.some(k => {
            if (i + j + k == 2020) { 
                console.log(i * j * k);
                return true;
            }
        })) return true;
    })) return true;
});