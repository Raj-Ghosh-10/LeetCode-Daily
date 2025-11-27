func maxSubarraySum(nums []int, k int) int64 {
    const INF int64 = 1<<62 - 1
    
    minPrefix := make([]int64, k)
    for i := 0; i < k; i++ {
        minPrefix[i] = INF
    }
    minPrefix[0] = 0

    var prefix int64 = 0
    var answer int64 = -INF

    for i, x := range nums {
        prefix += int64(x)
        mod := (i + 1) % k

        if minPrefix[mod] != INF {
            val := prefix - minPrefix[mod]
            if val > answer {
                answer = val
            }
        }

        if prefix < minPrefix[mod] {
            minPrefix[mod] = prefix
        }
    }

    return answer
}