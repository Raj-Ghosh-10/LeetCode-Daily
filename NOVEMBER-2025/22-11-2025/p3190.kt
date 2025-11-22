class Solution {
    fun minimumOperations(nums: IntArray): Int {
        var ans = 0
        for (x in nums) if (x % 3 != 0) ans++
        return ans
    }
}