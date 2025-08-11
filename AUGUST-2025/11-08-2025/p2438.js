/**
 * @param {number} n
 * @param {number[][]} queries
 * @return {number[]}
 */
var productQueries = function(n, queries) {
    let pows = [],
        currPow = 1,
        res = [],
        mod = ((10 ** 9) + 7)

    while(n > 0) {
        if(n % 2 == 1) pows.push(currPow)

        n = Math.floor(n/2)
        currPow *= 2
    }

    const prefArr = new Array(pows.length + 1).fill(1)

    for(let i = 1; i < prefArr.length; i++) {
        prefArr[i] = prefArr[i-1] * pows[i-1]
    }

    for(const [start, end] of queries) {
        const ans = prefArr[end + 1] / prefArr[start]
        res.push(ans % mod)
    }
 
    return res
};