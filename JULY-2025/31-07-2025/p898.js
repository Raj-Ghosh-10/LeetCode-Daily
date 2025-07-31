/**
 * @param {number[]} arr
 * @return {number}
 */
var subarrayBitwiseORs = function (a) {
    let uniqueBitwiseOrs = new Set();
    let prevBitwiseOrs = new Set();
    for (const e of a) {
        const currOrs = new Set();
        for (const por of prevBitwiseOrs) currOrs.add(por | e);
        currOrs.add(e);
        for (let e of currOrs) uniqueBitwiseOrs.add(e);
        prevBitwiseOrs = currOrs;
    }
    return uniqueBitwiseOrs.size;
};