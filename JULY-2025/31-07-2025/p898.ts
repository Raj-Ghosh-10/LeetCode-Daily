function subarrayBitwiseORs(arr: number[]): number {
    const bits: number[] = []
    let l: number = 0

    for(let i = 0; i < arr.length; i++){
        const r: number = bits.length
        bits.push(arr[i])

        while(l < r){
            const prev: number = bits[bits.length - 1]
            const bitwise: number = bits[l] | prev

            if(bitwise !== prev) bits.push(bitwise)
            l++
        }
    }

    return new Set(bits).size
};