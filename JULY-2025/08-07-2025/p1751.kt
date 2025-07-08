class Solution {
    fun maxValue(es: Array<IntArray>, k: Int): Int {
        es.sortBy { it[1] }
        var dp1 = arrayListOf(listOf(0, 0))
        var dp2 = arrayListOf(listOf(0, 0))
        repeat(k) {
            for ((s, e, v) in es) {
                var lo = 0; var hi = dp1.size - 1; var i = -1
                while (lo <= hi) {
                    val m = (lo + hi) / 2
                    if (dp1[m][0] < s) { lo = m + 1; i = max(i, m) } else { hi = m - 1 }
                }
                if (i >= 0 && dp1[i][1] + v > dp2.last()[1]) dp2 += listOf(e, dp1[i][1] + v)
            }
            dp1 = dp2; dp2 = arrayListOf(listOf(0, 0))
        }
        return dp1.last()[1]
    }
}