const suffixOrs = new Int32Array(17);

function countMaxOrSubsets(nums: number[]): number {
  const n = nums.length;

  suffixOrs[n] = 0;
  for (let i = n - 1; i >= 0; --i) {
    suffixOrs[i] = suffixOrs[i + 1] | nums[i];
  }

  const max = suffixOrs[0];
  
  const memo = new Map<number, number>();

  function dfs(i: number, or: number): number {
    if (i === n) return or < max ? 0 : 1;

    // If we include all remaining elements and the result is still < max,
    // we can stop early.
    if ((or | suffixOrs[i]) < max) return 0;

    const key = i << 17 | or;

    let ans = memo.get(key);

    if (ans === undefined) {
      ans = dfs(i + 1, or) + dfs(i + 1, or | nums[i]);
      memo.set(key, ans);
    }
    
    return ans;
  }

  return dfs(0, 0);
}