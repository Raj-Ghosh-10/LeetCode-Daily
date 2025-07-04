func kthCharacter(k int64, operations []int) byte {
	n := 0
	for i := range operations {
		n += operations[i] << i
	}
	return byte(97 + (countOnes((k - 1) & int64(n))%26))
}

func countOnes(num int64) int {
	var ones int64
	for num != 0 {
		ones += num & 1
		num = num >> 1
	}
	return int(ones)
}