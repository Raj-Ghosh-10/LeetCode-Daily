class Solution {
    fun minOperations(nums: IntArray, k: Int): Int {
        var sum = 0
        for (x in nums) sum += x
        return sum % k
    }
}