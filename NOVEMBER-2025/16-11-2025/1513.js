/**
 * @param {string} s
 * @return {number}
 */
var numSub = function(s) {
    let total = 0;
    s.split("0").filter(block => {
        const length = block.length;
        if(length) {
            total += (length * (length + 1))/2
        }
    });
    return total % (10**9 + 7);
};