class Solution {
    fun rangeAddQueries(n: Int, queries: Array<IntArray>): Array<IntArray> {
        val answer = Array(n) { IntArray(n) { 0 } }
        val board = Array(n + 9) { IntArray(n + 9) { 0 } }
        val preSums = Array(n + 9) { IntArray(n + 9) { 0 } }

        for ((row1, col1, row2, col2) in queries) {
            val a = row1 + 1
            val b = col1 + 1
            val c = row2 + 1
            val d = col2 + 1

            board[a][b] += 1
            board[a][d + 1] -= 1
            board[c + 1][b] -= 1
            board[c + 1][d + 1] += 1
        }

        for (i in 1..n) {
            var current = 0
            for (j in 1..n) {
                current += preSums[i - 1][j] + board[i][j]
                preSums[i][j] = preSums[i - 1][j] + board[i][j]
                answer[i - 1][j - 1] = current
            }
        }

        return answer
    }
}