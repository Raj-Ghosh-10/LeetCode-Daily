func numSubseq(nums []int, target int) int {
	ans := 0
	sort.Ints(nums)
	pow2 := make([]int, len(nums))
	pow2[0] = 1
	for i := 1; i < len(pow2); i++ {
		pow2[i] = (pow2[i-1] * 2) % 1000000007
	}
	for i := range nums {
		if nums[i]*2 > target {
			break
		}
		idx := sort.SearchInts(nums, target-nums[i]+1)
		ans = (ans+pow2[idx-i-1])%1000000007
	}
	return ans
}