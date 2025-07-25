func maxSum(nums []int) int {
	set := map[int]bool{}
	maxNum := nums[0]
	sum := 0
	for _, num := range nums {
		if num > 0 && !set[num] {
			set[num] = true
			sum += num
		}
		maxNum = max(maxNum, num)
	}
	if maxNum >= 0 {
		return sum
	} else {
		return maxNum
	}
}