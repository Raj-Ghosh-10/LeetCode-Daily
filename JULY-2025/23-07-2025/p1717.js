/**
 * @param {string} s
 * @param {number} x
 * @param {number} y
 * @return {number}
 */
var maximumGain = function (s, x, y) {
    function helper(pair, score) {
        let stack = []
        let gain = 0
        for (let ch of s) {
            if (ch === pair[1] && stack.length && stack[stack.length - 1] === pair[0]) {
                stack.pop()
                gain += score
            } else {
                stack.push(ch)
            }
        }
        s = stack.join('')
        return gain
    }

    let total = 0
    let firstPair = x > y ? 'ab' : 'ba';

    total += helper(firstPair, Math.max(x, y))
    total += helper(firstPair.split('').reverse().join(''), Math.min(x, y))
    return total
};