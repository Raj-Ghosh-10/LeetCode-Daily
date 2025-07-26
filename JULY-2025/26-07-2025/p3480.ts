function maxSubarrays(n: number, conflictingPairs: number[][]): number {
    let m = conflictingPairs.length;
    for (let i = 0; i < m; i++) {
        if (conflictingPairs[i][0] > conflictingPairs[i][1]) {
            [conflictingPairs[i][0], conflictingPairs[i][1]] = [conflictingPairs[i][1], conflictingPairs[i][0]];
        }
    }
    conflictingPairs.sort((x, y) => x[1] !== y[1] ? x[1] - y[1] : x[0] - y[0]);
    
    let j = 0;
    let mxlb = 1;
    let curlb = 1;
    let cur = -1;
    let res = new Array(m).fill(0);
    let ans = 0;
    
    for (let i = 1; i <= n; i++) {
        while (j < m && conflictingPairs[j][1] <= i) {
            if (cur === -1) {
                if (mxlb <= conflictingPairs[j][0]) {
                    curlb = conflictingPairs[j][0];
                    cur = j;
                }
            } else if (conflictingPairs[j][0] < curlb) {
                mxlb = Math.max(mxlb, conflictingPairs[j][0] + 1);
            } else if (conflictingPairs[j][0] === curlb) {
                mxlb = curlb + 1;
                cur = -1;
            } else {
                mxlb = curlb + 1;
                curlb = conflictingPairs[j][0];
                cur = j;
            }
            j++;
        }
        if (cur !== -1) {
            res[cur] += curlb - mxlb + 1;
        }
        if (cur === -1) ans += i - mxlb + 1;
        else ans += i - curlb;
    }
    
    let resmx = 0;
    for (let i = 0; i < m; i++) {
        resmx = Math.max(resmx, res[i]);
    }
    return ans + resmx;
}