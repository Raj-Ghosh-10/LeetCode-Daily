function maxSubsequence(nums: number[], k: number): number[] {

    return nums
        .map((num, idx) => ({ num, idx }))
        .sort((a, b) => b.num - a.num)
        .slice(0, k)
        .sort((a, b) => a.idx - b.idx)
        .map((a) => a.num);
};