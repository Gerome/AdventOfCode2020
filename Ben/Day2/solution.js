ipt=require('fs').readFileSync('i','utf8').split(/\r?\n/)
p1=p2=0
ipt.forEach(i => {
    [l,u,c,p] = i.replace("-"," ").replace(":","").split(" ")
     o=(p.match(new RegExp(c, "g"))||[]).length
    if (o>=l&&o<=u)
        p1++
    if (p[l-1]===c^p[u-1]===c)
        p2++
})
console.log(`${p1}\n${p2}`)
