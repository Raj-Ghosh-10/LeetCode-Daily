func reorderedPowerOf2(n int) bool {
    signature := func(x int) string {
        counts := make([]int, 10)
        if x == 0 { counts[0] = 1 }
        for x > 0 {
            counts[x%10]++
            x /= 10
        }
        parts := make([]string, 10)
        for i, v := range counts {
            parts[i] = strconv.Itoa(v)
        }
        return strings.Join(parts, ",")
    }

    target := signature(n)
    for power := 1; power <= 1000000000; power <<= 1 {
        if signature(power) == target {
            return true
        }
    }
    return false
}