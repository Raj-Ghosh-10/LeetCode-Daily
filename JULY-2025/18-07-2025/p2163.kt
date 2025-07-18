class Solution {
    fun minimumDifference(nums: IntArray): Long {
        val maxHeap = PriorityQueue<Int>(compareByDescending { it })
        val minHeap = PriorityQueue<Int>(compareBy { it })

        val n = nums.size / 3
        val leftSide = LongArray(2 * n)
        val rightSide = LongArray(2 * n)

        var lSum = 0L
        for (i in 0 until leftSide.size) {
            lSum += nums[i]
            maxHeap.add(nums[i])

            if (maxHeap.size > n) {
                lSum -= maxHeap.remove()
            }

            if (maxHeap.size == n) {
                leftSide[i] = lSum
            }
        }

        var rSum = 0L
        for (i in rightSide.lastIndex downTo  0) {
            val index = i + n
            rSum += nums[index]
            minHeap.add(nums[index])

            if (minHeap.size > n) {
                rSum -= minHeap.remove()
            }

            if (minHeap.size == n) {
                rightSide[i] = rSum
            }
        }

        var res = Long.MAX_VALUE

        for (i in (n - 1) until leftSide.size) {
            res = minOf(
                res,
                leftSide[i] - rightSide[i + 1 - n]
            )
        }

        // println(leftSide.toList())
        // println(rightSide.toList())

        return res
    }
}