/**
 * @param {string} colors
 * @param {number[]} neededTime
 * @return {number}
 */
var minCost = function(colors, neededTime) {
    const n = colors.length;
    let res = 0;
    let i = 0;
    while (i < n) {
        let j = i;
        let largest = neededTime[j];
        let sum = neededTime[j];
        while (j + 1 < n && colors[j] === colors[j + 1]) {
            j += 1;
            largest = Math.max(largest, neededTime[j]);
            sum += neededTime[j];
        }
        res += sum - largest;
        i = j + 1;
    }
    return res;
};