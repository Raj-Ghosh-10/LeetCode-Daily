/**
 * @param {number[]} basket1
 * @param {number[]} basket2
 * @return {number}
 */
var minCost = function(basket1, basket2) {
    const count1 = new Map();
    const count2 = new Map();
    let minX = Infinity;
    for (const x of basket1){
        count1.set(x, (count1.get(x) || 0) + 1)
        minX = Math.min(minX, x);
    }
    for (const x of basket2){
        count2.set(x, (count2.get(x) || 0) + 1)
        minX = Math.min(minX, x);
    }
    for (const [key, val1] of count1.entries()) {
        const val2 = count2.get(key) || 0;
        const minCount = Math.min(val1, val2);
        count1.set(key, val1 - minCount);
        count2.set(key, val2 - minCount);
    }
    const swap1 = [], swap2 = [];
    for (const [key, val] of count1.entries()){
        if (val % 2 !== 0){
            return -1;
        }
        for (let i = 0; i < val / 2; i++){
            swap1.push(key);
        }
    }
    for (const [key, val] of count2.entries()){
        if (val % 2 !== 0){
            return -1;
        }
        for (let i = 0; i < val / 2; i++){
            swap2.push(key);
        }
    }
    swap1.sort((a, b) => a - b);
    swap2.sort((a, b) => b - a);
    let res = 0; 
    for (let i = 0; i < swap1.length; i++){
        res += Math.min(swap1[i], swap2[i], 2 * minX);
    }
    return res;
};