func soupServings(n int) float64 {
	if n >= 4800 {
		return 1.0
	}
	return dp(n, n, make(map[[2]int]float64))
}

func dp(a, b int, cache map[[2]int]float64) float64 {
	switch {
	case a <= 0 && b <= 0:
		return 0.5
	case a <= 0:
		return 1.0
	case b <= 0:
		return 0.0
	}
	if val, ok := cache[[2]int{a, b}]; ok {
		return val
	}
	ret := 0.25 * (dp(a-100, b, cache) + dp(a-75, b-25, cache) + dp(a-50, b-50, cache) + dp(a-25, b-75, cache))
	cache[[2]int{a, b}] = ret
	return ret
}