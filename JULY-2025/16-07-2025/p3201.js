/**
 * @param {number[]} nums
 * @return {number}
 */
var maximumLength = function (nums) {
    let countEven = 0;
    let countOdd = 0;
    let countAlternate = 0;
    let previousParity = null;
    let i = 0;
    while (i < nums.length) {
        const isOdd = nums[i] % 2 === 1;
        
        countEven += Number(!isOdd);
        countOdd += Number(isOdd);

        countAlternate += Number(previousParity !== isOdd);

        previousParity = nums[i] % 2 === 1;
        i ++
    }

    return Math.max(countAlternate, countOdd, countEven)
};