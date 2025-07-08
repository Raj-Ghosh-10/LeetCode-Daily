func maxValue(events [][]int, k int) int {
     if len(events) == 0 || k == 0 {
        return 0
    }
    
    n := len(events)
    
    sort.Slice(events, func(i, j int) bool {
        return events[i][1] < events[j][1]
    })

    prev := make([]int, n)
    for i := 0; i < n; i++ {
        start := events[i][0]
        left, right := 0, i-1
        result := -1
        for left <= right {
            mid := (left + right) >> 1
            if events[mid][1] < start {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        prev[i] = result
    }

    curr := make([]int, k+1)
    next := make([]int, k+1)
    
    history := make([][]int, n+1)
    for i := range history {
        history[i] = make([]int, k+1)
    }
    
    for i := 1; i <= n; i++ {
        curVal := events[i-1][2]
        pRow := prev[i-1] + 1
        
        copy(next, curr)
        
        for j := 1; j <= k; j++ {
            if alt := history[pRow][j-1] + curVal; alt > next[j] {
                next[j] = alt
            }
        }
        
        copy(history[i], next)
        
        curr, next = next, curr
    }
    
    return curr[k]
}