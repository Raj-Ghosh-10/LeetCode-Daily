class Solution {
    fun maxSubarraySum(nums: IntArray, k: Int): Long {
        val INF = Long.MAX_VALUE
        val minPrefix = LongArray(k) { INF }
        minPrefix[0] = 0L

        var prefix = 0L
        var answer = Long.MIN_VALUE

        for (i in nums.indices) {
            prefix += nums[i]
            val mod = (i + 1) % k

            if (minPrefix[mod] != INF) {
                val candidate = prefix - minPrefix[mod]
                if (candidate > answer) {
                    answer = candidate
                }
            }

            if (prefix < minPrefix[mod]) {
                minPrefix[mod] = prefix
            }
        }

        return answer
    }
}