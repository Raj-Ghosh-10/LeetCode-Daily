/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var maximumLength = function(nums, k) {
    const dp = Array.from({length: nums.length}).map(() => Array.from({length: k}).fill(1));
    let max = 0;
    for (let i = nums.length - 1; i >= 0; i --) {
        for (let j = i + 1; j < nums.length; j ++) {
            const remainder = (nums[i] + nums[j]) % k;
            dp[i][remainder] = Math.max(dp[j][remainder] + 1, dp[i][remainder]);
            max = Math.max(max, dp[i][remainder]);
        }
    }
    
    return max;
};