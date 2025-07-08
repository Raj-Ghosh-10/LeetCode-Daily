/**
 * @param {number[][]} events
 * @param {number} k
 * @return {number}
 */
function maxValue(events, k) {
    events.sort((a, b) => a[0] - b[0]);
    const n = events.length;

    const starts = events.map(e => e[0]);
    const nextIdx = new Array(n).fill(n);

    for (let i = 0; i < n; i++) {
        const endDay = events[i][1];
        const j = binarySearch(starts, endDay + 1);
        nextIdx[i] = j;
    }

    const dp = Array.from({ length: n + 1 }, () => Array(k + 1).fill(0));

    for (let i = n - 1; i >= 0; i--) {
        for (let j = 1; j <= k; j++) {
            let skip = dp[i + 1][j];
            let take = events[i][2] + dp[nextIdx[i]][j - 1];
            dp[i][j] = Math.max(skip, take);
        }
    }

    return dp[0][k];
}

function binarySearch(arr, target) {
    let lo = 0, hi = arr.length;
    while (lo < hi) {
        let mid = (lo + hi) >> 1;
        if (arr[mid] < target) lo = mid + 1;
        else hi = mid;
    }
    return lo;
}