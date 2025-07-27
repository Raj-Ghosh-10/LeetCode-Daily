/**
 * @param {number[]} nums
 * @return {number}
 */
var countHillValley = function(nums) {
    let count = 0;
    let prevDelta = 0;
    for(let i = 1; i < nums.length; i++){
        const currentDelta = nums[i] - nums[i-1];
        if(currentDelta === 0) continue;
        if(currentDelta * prevDelta <0) count += 1;
        prevDelta = currentDelta;
    }
    return count;
};