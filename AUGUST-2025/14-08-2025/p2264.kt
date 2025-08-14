class Solution {
    fun largestGoodInteger(nums: String): String {
        var res = ""
        for (i in 2 until nums.length) {
            if (nums[i] == nums[i - 1] && nums[i] == nums[i - 2] && (res == "" || nums[i] > res[0])) {
                res = nums[i].toString() + nums[i - 1] + nums[i - 2]
            }
        }

        return res
    }
}