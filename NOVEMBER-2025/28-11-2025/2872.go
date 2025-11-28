func maxKDivisibleComponents(n int, edges [][]int, values []int, k int) int {
    g := make([][]int, n)
    for _, e := range edges {
        a, b := e[0], e[1]
        g[a] = append(g[a], b)
        g[b] = append(g[b], a)
    }

    ans := 0

    var dfs func(u, p int) int64
    dfs = func(u, p int) int64 {
        sum := int64(values[u])
        for _, v := range g[u] {
            if v == p {
                continue
            }
            sum += dfs(v, u)
        }
        if sum%int64(k) == 0 {
            ans++
            return 0
        }
        return sum
    }

    dfs(0, -1)
    return ans
}