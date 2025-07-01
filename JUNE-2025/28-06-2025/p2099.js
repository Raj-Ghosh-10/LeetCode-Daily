var maxSubsequence = function(nums, k) {
  return nums
    .map((n, i) => ([n, i]))
    .toSorted(([a], [b]) => a - b)
    .slice(nums.length - k, nums.length)
    .toSorted(([_, a], [__, b]) => a - b)
    .map(([x]) => x)
};