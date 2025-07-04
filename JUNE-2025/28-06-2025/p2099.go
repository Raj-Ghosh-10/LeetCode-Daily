func maxSubsequence(nums []int, k int) []int {
	numsCopy := slices.Clone(nums)
	kthLargest := quickSelect(numsCopy, k, 0, len(numsCopy))
	kthLargestNeeded := 0
	for i := len(numsCopy) - k; i < len(numsCopy); i++ {
		if numsCopy[i] == kthLargest {
			kthLargestNeeded++
		}
	}

	result := make([]int, 0)
	for _, num := range nums {
		if num > kthLargest {
			result = append(result, num)
		} else if num == kthLargest && kthLargestNeeded > 0 {
			result = append(result, num)
			kthLargestNeeded--
		}
	}
	return result
}

func quickSelect(
	nums []int,
	k int,
	start int,
	end int,
) int {
	if start < 0 || start >= end || end > len(nums) {
		panic("Invalid or empty range")
	}

	width := end - start
	if width < k {
		panic("There are less than k elements in the given range")
	} else if width == 1 {
		return nums[start]
	}

	pivot := start + rand.Intn(end-start)
	pivotValue := nums[pivot]

	nums[pivot], nums[end-1] = nums[end-1], nums[pivot]
	left := start
	right := end - 2

	for left <= right {
		if nums[left] < pivotValue {
			left++
		} else {
			nums[left], nums[right] = nums[right], nums[left]
			right--
		}
	}
	nums[end-1], nums[left] = nums[left], nums[end-1]

	diff := k - (end - left)
	if diff < 0 {
		return quickSelect(nums, k, left+1, end)
	} else if diff > 0 {
		return quickSelect(nums, diff, start, left)
	} else {
		return nums[left]
	}
}