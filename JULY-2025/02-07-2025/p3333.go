func possibleStringCount(word string, k int) int {
	if len(word) == k {
		return 1
	}
	if len(word) < k {
		return 0
	}
	clumsy_arr := []int{1}
	total_char := 1
	ans := 1
	for i := 1; i < len(word); i++ {
		if word[i] == word[i-1] {
			clumsy_arr[len(clumsy_arr)-1]++
		} else {
			total_char++
			if clumsy_arr[len(clumsy_arr)-1] > 1 {
				ans = (ans * (clumsy_arr[len(clumsy_arr)-1])) % 1_000_000_007
				clumsy_arr[len(clumsy_arr)-1]--
				clumsy_arr = append(clumsy_arr, 1)
			}
		}
	}
	ans = (ans * (clumsy_arr[len(clumsy_arr)-1])) % 1_000_000_007
	if clumsy_arr[len(clumsy_arr)-1] > 1 {
		clumsy_arr[len(clumsy_arr)-1]--
	} else {
		clumsy_arr = clumsy_arr[:len(clumsy_arr)-1]
	}
	if len(clumsy_arr) == 0 {
		return 1
	}
	if total_char >= k {
		return ans
	}
	total := k - total_char
	dp := make([]int, total)
	prefix := make([]int, total+1)
	for i := range dp {
		if clumsy_arr[len(clumsy_arr)-1] >= i {
			dp[i] = 1
		}
		prefix[i+1] = prefix[i] + dp[i]
	}
	for j := len(clumsy_arr) - 2; j >= 0; j-- {
		prefixN := make([]int, total+1)
		for i := range dp {
			dp[i] = prefix[i+1] - prefix[max(0, i-clumsy_arr[j])]
			prefixN[i+1] = (prefixN[i] + dp[i]) % 1_000_000_007
		}
		prefix = prefixN
	}
	return (ans - prefix[total] + 1_000_000_007) % 1_000_000_007
}