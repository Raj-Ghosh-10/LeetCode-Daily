/**
 * @param {number[][]} fruits
 * @param {number} startPos
 * @param {number} k
 * @return {number}
 */

var maxTotalFruits = function(fruits, startPos, k) {
    let res = 0;
    let sum = 0;
    let left = 0;

    for (let right = 0; right < fruits.length; right++) {
        sum += fruits[right][1];

        // we keep shrinking the window if distance exceeds k moves
        while (left <= right && 
                    !canVisit(fruits[left][0], fruits[right][0], startPos, k)) {
            sum -= fruits[left][1];
            left++;
        }

        res = Math.max(res, sum);
    }

    return res;

    // we check if the path from startPos to fruits[left][0] then to fruits[right][0] is within k moves
    function canVisit(leftPos, rightPos, start, k) {
        const leftFirst = Math.abs(start - leftPos) + Math.abs(rightPos - leftPos);
        const rightFirst = Math.abs(start - rightPos) + Math.abs(rightPos - leftPos);
        return Math.min(leftFirst, rightFirst) <= k;
    }
};