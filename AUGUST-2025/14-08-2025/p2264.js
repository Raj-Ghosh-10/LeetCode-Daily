/**
 * @param {string} num
 * @return {string}
 */
var largestGoodInteger = function(num) {
    if (num.length < 3) return ''

    let l = 0;
    let max = -Infinity;
    let rez;    
    for (let r = 1; r < num.length; r ++){
        if (num[l] !== num[r]) l = r
        if (r - l + 1 === 3) {
            max = Math.max(max, +num[r]);
            rez = `${max}${max}${max}`;
        }
    }

    return max !== -Infinity ? rez : ''
};