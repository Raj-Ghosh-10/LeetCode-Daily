var findLHS = function(nums) {
    let freq = new Map();
    for (let num of nums) {
        freq.set(num, (freq.get(num) || 0) + 1);
    }

    let ans = 0;
    for (let [key, val] of freq.entries()) {
        if (freq.has(key + 1)) {
            ans = Math.max(ans, val + freq.get(key + 1));
        }
    }
    return ans;
};