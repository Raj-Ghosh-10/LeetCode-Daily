class Solution {
    fun maximumUniqueSubarray(nums: IntArray): Int {
        var left = 0; var right = 0

        var sum = 0
        var res = 0
        val numSet = mutableSetOf<Int>()
        while (right < nums.size) {
            if (numSet.contains(nums[right])) {
                numSet.remove(nums[left])
                sum -= nums[left]
                left++
            } else {
                sum += nums[right]
                res = maxOf(res, sum)
                numSet.add(nums[right])

                right++
            }
        }

        return res
    }
}