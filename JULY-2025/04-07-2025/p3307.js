/**
 * @param {number} k
 * @param {number[]} operations
 * @return {character}
 */
var kthCharacter = function(k, operations) {
    let pow = 0;
    while (k >= 2 ** pow) {
        pow++;
    }
    let len = 2 ** pow;
    let shift = 0;
    while (k > 1) {
        if (len / 2 < k) {
            k -= len / 2;
            if (operations[pow - 1]) {
                shift++;
            }
        }

        pow--;
        len /= 2;
    }

    return String.fromCharCode(97 + (shift % 26));
};