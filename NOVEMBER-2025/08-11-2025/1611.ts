function minimumOneBitperations(n: number): number {
    let bin = n.toString(2).split('').reverse() // bit array stack

    let result = 0

    while (bin.length) {
        const isOne = bin.pop() === '1'
        if (isOne) {
            // add amount of steps we know are after this one
            result += 1 << (bin.length )
            // flip the next bit
            bin[bin.length - 1] = bin[bin.length - 1] === '1' ? '0' : '1'
        }
    }

    return result
};