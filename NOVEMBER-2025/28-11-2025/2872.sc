object Solution {
    def maxKDivisibleComponents(n: Int, edges: Array[Array[Int]], values: Array[Int], k: Int): Int = {
        val g = Array.fill(n)(List[Int]())
        for (e <- edges) {
            val a = e(0)
            val b = e(1)
            g(a) = b :: g(a)
            g(b) = a :: g(b)
        }

        var ans = 0

        def dfs(u: Int, p: Int): Long = {
            var sum = values(u).toLong
            for (v <- g(u)) {
                if (v != p) {
                    sum += dfs(v, u)
                }
            }
            if (sum % k == 0) {
                ans += 1
                0
            } else sum
        }

        dfs(0, -1)
        ans
    }
}