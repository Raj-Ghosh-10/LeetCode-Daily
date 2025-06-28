class Solution {
    fun maxSubsequence(nums: IntArray, k: Int): IntArray {
        val ascIndices = PriorityQueue<Int> { a, b ->
            nums[a] - nums[b]
        }
        for (i in nums.indices) {
            ascIndices.add(i)
            if (ascIndices.size > k) {
                ascIndices.poll()
            }
        }
        val result = IntArray(k)
        var idx = 0
        for (i in nums.indices) {
            if (ascIndices.contains(i)) {
                result[idx++] = nums[i]
            }
        }
        return result
    }
}