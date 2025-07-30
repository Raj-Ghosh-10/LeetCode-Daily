func longestSubarray(nums []int) int {
    maxValue := nums[0]

    for _, n := range nums {
        if n > maxValue {
            maxValue = n
        }
    }
    curr := 0
    maxLengthFound := 0

    for _, n := range nums {
        if n == maxValue {
            curr++
            if curr > maxLengthFound {
                maxLengthFound = curr
            }
        }else{
            curr = 0
        }
    }
    return maxLengthFound
}