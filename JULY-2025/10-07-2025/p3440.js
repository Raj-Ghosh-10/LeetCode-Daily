/**
 * @param {number} eventTime
 * @param {number[]} startTime
 * @param {number[]} endTime
 * @return {number}
 */

var maxFreeTime = function(eventTime, startTime, endTime) {
    const n = startTime.length;
    if (n === 0) return eventTime;
    const g = new Array(n + 1);
    let best = 0;
    for (let i = 0; i < n; i++) {
        const prevEnd = i === 0 ? 0 : endTime[i - 1];
        const gap = startTime[i] - prevEnd;
        g[i] = gap;
        if (gap > best) best = gap;
    }
    const lastGap = eventTime - endTime[n - 1];
    g[n] = lastGap;
    best = Math.max(best, lastGap);
    const suffixMax = new Array(n + 2);
    suffixMax[n + 1] = 0;  
    for (let i = n; i >= 0; i--) {
        const next = suffixMax[i + 1];
        const val  = g[i];
        suffixMax[i] = val > next ? val : next;
    }
    let prefix = 0;
    for (let i = 0; i < n; i++) {
        const dur      = endTime[i] - startTime[i];
        const leftGap  = g[i];
        const rightGap = g[i + 1];
        const merged = leftGap + dur + rightGap;
        const other = prefix > suffixMax[i + 2] ? prefix : suffixMax[i + 2];
        const candidate = other >= dur ? merged : merged - dur;
        if (candidate > best) best = candidate;
        if (leftGap > prefix) prefix = leftGap;
    }

    return best;
};