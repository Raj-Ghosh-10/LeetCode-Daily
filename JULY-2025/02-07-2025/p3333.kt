class Solution {
    fun possibleStringCount(w: String, k: Int): Int {
        val M = 1_000_000_007L; val g = ArrayList<Int>()
        var c = 1; var all = 1L; var n = k
        for (i in 1..w.length) if (i < w.length && w[i] == w[i - 1]) ++c
            else { --n; if (c - 1 > 0) g += c - 1; all = (all * c) % M; c = 1 }
        if (n <= 0) return all.toInt()
        val dp = Array(2) { LongArray(n) }; dp[0][0] = 1L; val ps = LongArray(n + 1) 
        for (i in 0..<g.size) for (kk in 0..<n) {
            ps[kk + 1] = (ps[kk] + dp[i % 2][kk]) % M
            dp[1 - (i % 2)][kk] = (ps[kk + 1] - ps[max(0, kk - g[i])]) % M
        }
        var bad = 0L; for (i in 0..<n) bad = (bad + dp[g.size % 2][i]) % M
        return ((all + M - bad) % M).toInt()
    }

}