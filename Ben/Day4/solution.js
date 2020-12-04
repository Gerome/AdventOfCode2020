i = require('fs').readFileSync('i', 'utf8').split(/\r?\n\r?\n/)
pf = ['ecl','pid','eyr','hcl','byr','iyr','hgt']
console.log(i.filter(p => pf.filter(m => p.includes(m+":")).length >= pf.length).length)