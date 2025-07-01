class Solution {
    fun numSubseq(n: IntArray, t: Int): Int {
        val M = 1_000_000_007; n.sort(); var cnt = 0
        val f = IntArray(n.size); f[0] = 1; var j = n.size - 1
        for (i in 1..<n.size) f[i] = (2 * f[i - 1]) % M
        for ((i, x) in n.withIndex()) {
            while (j >= 0 && x + n[j] > t) j--
            if (j < i) break
            cnt = (cnt + f[j - i]) % M
        }
        return cnt
    }
}