class Solution {
    fun maxTotalFruits(fruits: Array<IntArray>, startPos: Int, k: Int): Int {
        var left = 0
        var sum = 0
        var maxSum = 0

        for (right in fruits.indices) {
            sum += fruits[right][1]

            while (left <= right && minSteps(fruits[left][0], fruits[right][0], startPos) > k) {
                sum -= fruits[left][1]
                left++
            }

            maxSum = maxOf(maxSum, sum)
        }

        return maxSum
    }

    private fun minSteps(left: Int, right: Int, start: Int): Int {
        val goLeftFirst = kotlin.math.abs(start - left) + (right - left)
        val goRightFirst = kotlin.math.abs(start - right) + (right - left)
        return minOf(goLeftFirst, goRightFirst)
    }
}