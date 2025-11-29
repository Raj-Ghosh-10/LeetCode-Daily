/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var minOperations = function(nums, k) {
    let sum = 0;
    for (let x of nums) sum += x;
    return sum % k;
};