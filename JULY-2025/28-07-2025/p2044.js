/**
 * @param {number[]} nums
 * @return {number}
 */
var countMaxOrSubsets = function(nums) {
    const n = nums.length;
    let max = nums.reduce((a, e) => a | e, 0);
    let count = 0;

    const dfs = (i, or) => {
        if (or === max) {
            // Optimization: if OR already equals max, we skip the rest of recursion.
            // The number of remaining subsets from here is 2^(nums.length - i)
            count += 1 << ( n - i);
            return;
        }

        if (i === n) {
            return;
        }

        dfs(i + 1, or);            // we exclude nums[i]
        dfs(i + 1, or | nums[i]);  // we include nums[i]
    };

    dfs(0, 0);
    return count;
};