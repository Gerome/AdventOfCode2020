ipt=require('fs').readFileSync('i','utf8').split(/\r?\n/).map(Number)
ipt.some(i=>{
    if(ipt.some(j=>{
        if(i+j==2020){
            console.log(i*j)
            return true
        }
    }))return true
})

ipt.some(i=>{
    if(ipt.some(j=>{
       if(ipt.some(k=>{
            if(i+j+k==2020){
                console.log(i*j*k)
                return true
            }
        }))return true
    }))return true
})