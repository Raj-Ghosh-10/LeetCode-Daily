/**
 * @param {number} n
 * @return {boolean}
 */
var isPowerOfFour = function(n) {
    if(n==1) return true;
    let four = 4;
    if(n<1) return false;
    while (four < n) {
        four = four*4;
    }
    return four == n;
};