function findLHS(nums: number[]): number {
    const freq: Record<number, number> = {};
    for (const n of nums) {
        freq[n] = (freq[n] || 0) + 1;
    }

    let ans = 0;
    for (const keyStr in freq) {
        const key = Number(keyStr);
        if (freq.hasOwnProperty(key + 1)) {
            ans = Math.max(ans, freq[key] + freq[key + 1]);
        }
    }

    return ans;
}