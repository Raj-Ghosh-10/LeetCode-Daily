func maxFreeTime(eventTime int, k int, startTime []int, endTime []int) int {
    n := len(startTime)
    gap := startTime[0]
    for i:=1; i<k; i++ { gap += startTime[i] - endTime[i-1] }
    if k < n { gap += startTime[k] - endTime[k-1] } else {
        gap += eventTime - endTime[n-1]
        return gap
    }
    max := gap
    for i:=k+1; i<n; i++ {
        if i == k+1 { gap -= startTime[0] } else {
            gap -= startTime[i-k-1] - endTime[i-k-2]
        }
        gap += startTime[i] - endTime[i-1]
        if max < gap { max = gap }
    }
    if n-k == 1 { gap -= startTime[0] } else {
        gap -= startTime[n-k-1] - endTime[n-k-2]
    }
    gap += eventTime - endTime[n-1]
    if max < gap { return gap }
    return max
}