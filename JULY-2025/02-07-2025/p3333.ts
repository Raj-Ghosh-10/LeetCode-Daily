function possibleStringCount(word: string, k: number): number {
    const mod = 1_000_000_007;
    const cnt : number[] = [];
    let total = 1;
    const n = word.length;
    let i = 0;
    while (i < n){
        let j = i;
        while (i < n && word[i] === word[j]){
            i++;
        }
        const len = i - j;
        if (len > 0){
            cnt.push(len - 1)
            total = total * len % mod;
        }
        k--;
    }
    if (k <= 0)
        return total;
    const dp : number[] = new Array(k).fill(0);
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
    const ans = (total - dp[k - 1] + mod) % mod;
    return ans;
};