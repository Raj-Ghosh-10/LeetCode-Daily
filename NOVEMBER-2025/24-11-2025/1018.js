/**
 * @param {number[]} nums
 * @return {boolean[]}
 */
var prefixesDivBy5 = function(nums) {
    const ans = [];
    let mod = 0;

    for (let bit of nums) {
        mod = (mod * 2 + bit) % 5;
        ans.push(mod === 0);
    }

    return ans;
};