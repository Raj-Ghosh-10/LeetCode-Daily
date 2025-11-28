class Solution {
    func maxKDivisibleComponents(_ n: Int, _ edges: [[Int]], _ values: [Int], _ k: Int) -> Int {
        var g = Array(repeating: [Int](), count: n)
        for e in edges {
            let a = e[0], b = e[1]
            g[a].append(b)
            g[b].append(a)
        }

        var ans = 0

        func dfs(_ u: Int, _ p: Int) -> Int64 {
            var sum = Int64(values[u])
            for v in g[u] {
                if v == p { continue }
                sum += dfs(v, u)
            }
            if sum % Int64(k) == 0 {
                ans += 1
                return 0
            }
            return sum
        }

        _ = dfs(0, -1)
        return ans
    }
}