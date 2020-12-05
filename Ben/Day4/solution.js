i=require('fs').readFileSync('i','utf8').split(/\r?\n\r?\n/g)
pf=[['ecl','m',["amb","blu","brn","gry","grn","hzl","oth"]],
['pid','r',new RegExp(/^[0-9]{9,9}$/)],
['eyr','n',[2020,2030]],
['hcl','r',new RegExp(/#[0-9|a-f]{6,6}/)],
['byr','n',[1920,2002]],
['iyr','n',[2010,2020]],
['hgt','h',[59,76,150,193]]]
console.log(i.filter(p=>pf.filter(m=>p.includes(m[0]+":")).length>=pf.length).length)

console.log(i.map(line=>{
    c=0;
    line.replace(/\r?\n/g," ").split(" ").forEach(l=>{
        pf.forEach(m=>{
            if (l&&l.includes(m[0])){
                y=l.split(":")[1];
                switch(m[1]){
                    case"m":
                        m[2].indexOf(y)>-1?c++:0
                        break
                    case"r":
                        y.match(m[2])?c++:0
                        break
                    case"h":
                        if(y.includes("cm")){
                            y.split("cm")[0]>=m[2][2]&&y.split("cm")[0]<=m[2][3]?c++:0
                        }if(y.includes("in")){
                            y.split("in")[0]>=m[2][0]&&y.split("in")[0]<=m[2][1]?c++:0
                        }break
                    case"n":
                        y>=m[2][0]&&y<=m[2][1]?c++:0
                        break
                }
            }
        })
    })
    return c
}).filter(n=>n>=pf.length).length)