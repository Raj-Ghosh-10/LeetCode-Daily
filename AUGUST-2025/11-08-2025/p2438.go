func productQueries(n int, queries [][]int) []int {
    
    const mod = int(1e9+7)
    q := len(queries)
    res := make([]int, q)

    for i:= 0; i < q; i++{
        res[i] = 1
    }

    for idx, query := range queries{
        start, end := query[0], query[1]
        count := 0

        for i := 0; i < 32; i++{
            if (n & (1 << i)) != 0 {
                if count >= start && count <= end{
                    res[idx] = (res[idx] * (1 << i)) % mod
                }
                if count > end {
                    break
                }
                count++
            }
        }
    }
    return res
}