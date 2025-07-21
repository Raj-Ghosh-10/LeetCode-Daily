const decoder = new TextDecoder()
const encoder = new TextEncoder()
const buffer = new ArrayBuffer(10**5)
const out = new Uint8Array(buffer)

/**
 * @param {string} s
 * @return {string}
 */
const makeFancyString = s => {
    s = encoder.encode(s)
    let curr, count, outI = 0

    for (let i = 0; i < s.length; i++) {
        if (s[i] === curr) count++
        else {
            count = 1
            curr = s[i]
        }
        if (count < 3) out[outI++] = s[i]
    }

    return decoder.decode(new DataView(buffer, 0, outI))
}