/**
 * @param {number[]} nums
 * @return {number[]}
 */
var getSneakyNumbers = function(nums) {
    let numsObject = {};
    let sneakyNumbers = [];
    for(let i = 0; i < nums.length; i++) {
        if(numsObject.hasOwnProperty(nums[i])) {
            sneakyNumbers.push(nums[i]);
            if(sneakyNumbers.length === 2) {
                break;
            }
        }
        else {
            numsObject[nums[i]] = 1;
        }
    }
    return sneakyNumbers;
};