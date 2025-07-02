/**
 * @param {string} word
 * @param {number} k
 * @return {number}
 */
var possibleStringCount = function(word, k) {
    const mod = 1e9 + 7;
    const cnt = [];
    let total = 1;
    const n = word.length;
    let i = 0;
    while (i < n){
        let j = i;
        while (i < n && word[i] === word[j]){
            i++;
        }
        let len = i - j;
        if (len > 0){
            cnt.push(len - 1);
            total = total * len % mod;
        }
        k--;
    }
    if (k <= 0)
        return total;
    const dp = Array(k).fill(0);
    dp[0] = 1;
    for (const c of cnt){
        for (let i = 1; i < k; i++){
            dp[i] = (dp[i] + dp[i - 1]) % mod;
        }
        for (let i = k - 1; i > c; i--){
            dp[i] = (dp[i] - dp[i - c - 1] + mod) % mod;
        }
    }
    for (let i = 1; i < k; i++){
        dp[i] = (dp[i] + dp[i - 1]) % mod;
    }
    let ans = (total - dp[k - 1] + mod) % mod;
    return ans;
};