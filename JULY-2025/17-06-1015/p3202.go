func maximumLength(nums []int, k int) int {
	maxLen := 0

	// Try every possible (a + b) % k == val
	for val := 0; val < k; val++ {
		dp := make([]int, k) // dp[r] = longest subsequence ending with num % k == r
		for _, num := range nums {
			r := num % k
			requiredPrev := (val - r + k) % k
			dp[r] = max(dp[r], dp[requiredPrev]+1)
		}
		for _, v := range dp {
			if v > maxLen {
				maxLen = v
			}
		}
	}

	return maxLen
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}