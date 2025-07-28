class Solution {
    fun countMaxOrSubsets(nums: IntArray): Int {
        var max = 0
        for (num in nums) {
            max = max or num
        }
        var res = 0
        val n = nums.size
        for (i in 0..n - 1) {
            res += dfs(i, 0, max, nums)
        }
        return res
    }

    private fun dfs(pos: Int, cur: Int, max: Int, nums: IntArray): Int {
        val n = nums.size
        var res = 0
        if (cur or nums[pos] == max) {
            res += 1 shl n - pos - 1
        } else {
            for (i in pos + 1..n - 1) {
                res += dfs(i, cur or nums[pos], max, nums)
            }
        }
        return res
    }
}