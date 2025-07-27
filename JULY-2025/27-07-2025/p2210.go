func countHillValley(nums []int) int {
	numLength := len(nums)
	result := 0

	for i := 1; i < numLength-1; i++ {
		leftIndex, rightIndex := i-1, i+1
		leftValue, rightValue, currentValue := nums[leftIndex], nums[rightIndex], nums[i]

		for leftIndex > 0 && leftValue == currentValue {
			leftIndex--
			leftValue = nums[leftIndex]
		}

		for rightIndex < numLength-1 && rightValue == currentValue {
			rightIndex++
			rightValue = nums[rightIndex]

			i++

		}

		if (leftValue < currentValue && rightValue < currentValue) || (leftValue > currentValue && rightValue > currentValue) {
			result++
		}
	}

	return result
}