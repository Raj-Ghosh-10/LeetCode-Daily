function maxValue(events: number[][], k: number): number {
    events.sort((a, b) => a[0] - b[0]);
    const n = events.length;
    const starts = events.map(e => e[0]);
    const next_idx = new Array(n).fill(0);
    for (let i = 0; i < n; i++){
        let l = i + 1;
        let r = n;
        while (l < r){
            let m = Math.floor((l + r) / 2);
            if (starts[m] > events[i][1])
                r = m;
            else 
                l = m + 1;
        }
        next_idx[i] = l;
    }
    const dp = Array.from({length : 2}, () => new Array(n + 1).fill(0));
    for (let j = 1; j <= k; j++){
        const cur = j % 2;
        const prev = (j - 1) % 2;
        for (let i = n - 1; i >= 0; i--){
            const attend = events[i][2] + dp[prev][next_idx[i]];
            const skip = dp[cur][i + 1];
            dp[cur][i] = Math.max(attend, skip);
        }
    }
    return dp[k % 2][0];
};