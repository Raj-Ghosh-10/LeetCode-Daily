/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var numSubseq = function(nums, target) {
    const mod = 1e9 + 7;
    nums.sort((a, b) => a - b);
    const n = nums.length;
    const pows = Array(n).fill(1);
    for (let i = 1; i < n; i++){
        pows[i] = (pows[i - 1] * 2) % mod;
    }
    let left = 0, right = n - 1, res = 0;
    while (left <= right){
        if (nums[left] + nums[right] > target){
            right--;
        } else {
            res = (res + pows[right - left]) % mod;
            left++;
        }
    }
    return res;
};