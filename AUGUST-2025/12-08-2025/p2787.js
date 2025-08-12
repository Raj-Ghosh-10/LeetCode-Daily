/**
 * @param {number} n
 * @param {number} x
 * @return {number}
 */

const MOD = 1e9+7;

const uniqueWays = (n, prefix, i, sum, dp) => {
    if(sum === n) {
        return 1;
    }
    if(i < 0 || sum > n) {
        return 0;
    }
    const key = `${i}-${sum}`;
    if(dp.has(key)) return dp.get(key);
    const include = uniqueWays(n, prefix, i-1, sum+prefix[i], dp);
    const exclude = uniqueWays(n, prefix, i-1, sum, dp);
    const res = (include + exclude)%MOD;
    dp.set(key, res);
    return res;
}

var numberOfWays = function(n, x) {
    const prefix = [];
    let i = 1;
    let cur = 1;
    prefix.push(cur);
    while(Math.pow(++cur,x) <= n) {
        prefix.push(Math.pow(cur,x))
    }
    const dp = new Map();
    return uniqueWays(n, prefix, prefix.length-1, 0, dp);
};