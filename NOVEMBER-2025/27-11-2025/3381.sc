object Solution {
    def maxSubarraySum(nums: Array[Int], k: Int): Long = {
        val INF: Long = 1L << 60
        val minPrefix = Array.fill[Long](k)(INF)
        minPrefix(0) = 0L

        var prefix: Long = 0L
        var answer: Long = -INF

        for (i <- nums.indices) {
            prefix += nums(i)
            val mod = (i + 1) % k

            answer = Math.max(answer, prefix - minPrefix(mod))

            minPrefix(mod) = Math.min(minPrefix(mod), prefix)
        }

        answer
    }
}