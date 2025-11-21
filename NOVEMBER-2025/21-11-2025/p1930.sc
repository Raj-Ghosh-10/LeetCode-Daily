object Solution {
    def countPalindromicSubsequence(s: String): Int = {
        val n = s.length
        val first = Array.fill(26)(-1)
        val last = Array.fill(26)(-1)

        for (i <- 0 until n) {
            val c = s(i) - 'a'
            if (first(c) == -1) first(c) = i
            last(c) = i
        }

        var ans = 0

        for (c <- 0 until 26) {
            if (first(c) != -1 && last(c) - first(c) > 1) {
                var mask = 0
                for (i <- first(c) + 1 until last(c)) {
                    mask |= 1 << (s(i) - 'a')
                }
                ans += Integer.bitCount(mask)
            }
        }

        ans
    }
}