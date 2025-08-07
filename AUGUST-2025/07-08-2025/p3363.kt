class Solution {
    fun maxCollectedFruits(fruits: Array<IntArray>): Int {
        val n = fruits.size
        val dp = Array(n) { IntArray(n) { -1 } }
        dp[0][0] = fruits[0][0]
        for (i in 1 until n) {
            dp[i][i] = dp[i - 1][i - 1] + fruits[i][i]
        }
        dp[0][n - 1] = fruits[0][n - 1]
        for (i in 1 until n - 1) {
            for (j in i + 1 until n) {
                dp[i][j] = maxOf(
                    dp[i - 1][j - 1],
                    dp[i - 1][j],
                    if (j + 1 < n) dp[i - 1][j + 1] else -1
                )
                if (dp[i][j] != -1) dp[i][j] += fruits[i][j]
            }
        }
        dp[n - 1][0] = fruits[n - 1][0]
        for (j in 1 until n - 1) {
            for (i in n - 1 downTo j + 1) {
                dp[i][j] = maxOf(
                    if (i + 1 < n) dp[i + 1][j - 1] else -1,
                    dp[i][j - 1],
                    dp[i - 1][j - 1]
                )
                if (dp[i][j] != -1) dp[i][j] += fruits[i][j]
            }
        }
        return dp[n - 1][n - 1] + dp[n - 2][n - 1] + dp[n - 1][n - 2]
    }
}