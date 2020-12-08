i = require('fs').readFileSync('i', 'utf8').split(/\r?\n/).map(a => a.split(" "))
acc = n = 0
ins = []
console.log(i<i.length)
while (1) {
    i[n][0] == 'nop' ? n++ : i[n][0] == 'acc' ? acc += +i[n++][1] : n += +i[n][1]
    if(ins.find(a => a == n)){
        console.log(acc)
        break
    }
    ins.push(n)
}

while (n<i.length) {
    i[n][0] == 'nop' ? n++ : i[n][0] == 'acc' ? acc += +i[n++][1] : n += +i[n][1]
    if(ins.find(a => a == n)){
        console.log(acc)
        break
    }
    ins.push(n)
}