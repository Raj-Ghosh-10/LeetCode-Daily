/**
 * @param {number} eventTime
 * @param {number} k
 * @param {number[]} startTime
 * @param {number[]} endTime
 * @return {number}
 */
var maxFreeTime = function(eventTime, k, startTime, endTime) {
    const numOfSchedule = startTime.length;
    const prefixSum = Array.from({length: numOfSchedule + 1}).fill(0);
    
    for (let i = 0; i < numOfSchedule; i ++) {
        prefixSum[i + 1] = prefixSum[i] + (endTime[i] - startTime[i]);
    }
    
    let res = 0;
    for (let i = k - 1; i < numOfSchedule; i ++) {
        let left = i === k - 1 ? 0 : endTime[i - k]; 
        let right = i === numOfSchedule - 1 ? eventTime : startTime[i + 1];
        
        const totalTime = right - left;
        
        const duration = prefixSum[i + 1] - prefixSum[i - k + 1];
        console.log(totalTime, duration);
        
        const gap = totalTime - duration
        res = Math.max(gap, res);
    }
    
    return res;
};