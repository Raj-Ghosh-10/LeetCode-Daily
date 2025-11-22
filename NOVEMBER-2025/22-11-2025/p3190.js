var minimumOperations = function(nums) {
    let ans = 0;
    for (let x of nums) if (x % 3 !== 0) ans++;
    return ans;
};