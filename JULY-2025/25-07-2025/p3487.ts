function maxSum(nums: number[]): number {
    let sum = 0, mx = Number.MIN_SAFE_INTEGER;
    const s = new Set<number>();
    for(let i = 0; i < nums.length; ++i){
        mx = Math.max(mx, nums[i]);
        if(nums[i] <= 0 || s.has(nums[i])) continue;
        sum += nums[i];
        s.add(nums[i]);
    }
    return (mx <= 0)?mx:sum;
}