class Solution {
    fun prefixesDivBy5(nums: IntArray): List<Boolean> {
        val ans = ArrayList<Boolean>()
        var mod = 0

        for (bit in nums) {
            mod = (mod * 2 + bit) % 5
            ans.add(mod == 0)
        }

        return ans
    }
}