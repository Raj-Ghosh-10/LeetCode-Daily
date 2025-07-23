function maximumGain(s: string, x: number, y: number): number {
    if (x < y) {
        [x, y] = [y, x]
        s = s.split('').reverse().join('')
    }
    let a = 0
    let b = 0
    let result = 0

    for (const char of s) {
        if (char === 'a') {
            a++
        } else if (char === 'b') {
            if (!a) {
                b++
                continue
            }

            a--
            result += x

        } else {
            result += Math.min(a, b) * y
            a = b = 0
        }
    }

    return result + Math.min(a, b) * y
};