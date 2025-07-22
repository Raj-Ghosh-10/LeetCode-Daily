/**
 * @param {number[]} nums
 * @return {number}
 */
var maximumUniqueSubarray = function(nums) {
    let seen= new Set()
    let left =0, right= 0;
    let currSum= 0, maxSum= 0;

    while(right < nums.length){
        while(seen.has(nums[right])){
            seen.delete(nums[left])
            currSum -= nums[left]
            left++
        }

        seen.add(nums[right])
        currSum += nums[right]
        maxSum = Math.max(maxSum, currSum)
        right++
    }

    return maxSum
};