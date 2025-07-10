function maxFreeTime(eventTime: number, k: number, startTime: number[], endTime: number[]): number {
    let scheduledTime = 0;
    startTime.unshift(0);
    endTime.unshift(0);
    startTime.push(eventTime);
    endTime.push(eventTime);
    for(let i = 0; i < k; i++) {
        scheduledTime += endTime[i] - startTime[i];
    }
    let maxTime = startTime[k] - scheduledTime;
    for(let i = 1; i < startTime.length - k; i++) {
        scheduledTime -= endTime[i - 1] - startTime[i - 1];
        scheduledTime += endTime[i + k - 1] - startTime[i + k - 1];
        maxTime = Math.max(maxTime, startTime[i + k] - endTime[i - 1] - scheduledTime);
    }
    return maxTime;
};