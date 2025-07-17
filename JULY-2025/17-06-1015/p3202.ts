function maximumLength(nums: number[], k: number): number {
    const dp = [];
    for (let i = 0; i < k; i++) {
        dp[i] = [];
        for (let j = 0; j < k; j++) {
            dp[i].push(0);
        }
    }
    
    let max = 0;
    for (let i = 0; i < nums.length; i++) {
        const rem = nums[i] % k;
        for (let j = 0; j < k; j++) {
            max = Math.max(dp[rem][j] = dp[j][rem] + 1, max);
        }
    }

    return max;
};