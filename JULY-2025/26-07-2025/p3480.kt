class Solution {
    fun maxSubarrays(n: Int, conflictingPairs: Array<IntArray>): Long {
        val seen = IntArray(n + 1)
        val conflictMap = mutableMapOf<Int, MutableList<Int>>()

        for ((a, b) in conflictingPairs) {
            conflictMap.computeIfAbsent(maxOf(a, b)) { mutableListOf() }.add(minOf(a, b))
        }

        var validSubarrays = 0L
        val gain = LongArray(n + 1)
        var maxLeft = 0
        var secondMaxLeft = 0

        for (right in 1..n) {
            val conflicts = conflictMap[right] ?: emptyList()
            for (left in conflicts) {
                if (left > maxLeft) {
                    secondMaxLeft = maxLeft
                    maxLeft = left
                } else if (left > secondMaxLeft) {
                    secondMaxLeft = left
                }
            }

            validSubarrays += (right - maxLeft).toLong()

            if (maxLeft > 0) {
                gain[maxLeft] += (maxLeft - secondMaxLeft).toLong()
            }
        }

        return validSubarrays + gain.maxOrNull()!!
    }
}