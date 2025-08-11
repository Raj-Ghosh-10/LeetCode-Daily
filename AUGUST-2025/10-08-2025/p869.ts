function reorderedPowerOf2(n: number): boolean {

    let sortDigit = (num) =>  num.toString().split('').sort().join('')
    let target = sortDigit(n)

    for(let i = 1; i < 1e9; i=i*2) {
        if(sortDigit(i) === target) return true
    }

    return false
};