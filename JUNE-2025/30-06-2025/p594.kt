class Solution {
    fun findLHS(nums: IntArray): Int {
        val freq = nums.asSequence().groupingBy { it }.eachCount()
        var result = 0
        for ((num, count) in freq) {
            freq[num + 1]?.let {
                result = maxOf(result, count + it)
            }
        }
        return result
    }
}