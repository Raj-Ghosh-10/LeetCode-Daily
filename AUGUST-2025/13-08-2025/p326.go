func isPowerOfThree(n int) bool {
	x := float64(0)
	for int(math.Pow(3, x)) <= n {
		if int(math.Pow(3, x)) == n {
			return  true
		}
		x++
	}	
	return false
}