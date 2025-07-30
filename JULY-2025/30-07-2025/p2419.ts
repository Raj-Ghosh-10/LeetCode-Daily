function longestSubarray(nums: number[]): number {
  const max = Math.max(...nums)
  let maxSubArrLength = 0
  let count = 0

  for (let i = 0; i < nums.length; i++) {
    if(nums[i] === max){
      count++
    }else if(count !== 0){
      maxSubArrLength = Math.max(maxSubArrLength, count)
      count = 0
    }
  }

  return  Math.max(maxSubArrLength, count)
};