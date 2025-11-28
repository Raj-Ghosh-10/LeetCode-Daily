class Solution {
    fun maxKDivisibleComponents(n: Int, edges: Array<IntArray>, values: IntArray, k: Int): Int {
        val g = Array(n) { ArrayList<Int>() }
        for (e in edges) {
            val a = e[0]
            val b = e[1]
            g[a].add(b)
            g[b].add(a)
        }

        var ans = 0

        fun dfs(u: Int, p: Int): Long {
            var sum = values[u].toLong()
            for (v in g[u]) {
                if (v == p) continue
                sum += dfs(v, u)
            }
            if (sum % k == 0L) {
                ans++
                return 0
            }
            return sum
        }

        dfs(0, -1)
        return ans
    }
}