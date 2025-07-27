class Solution {
    fun countHillValley(nums: IntArray): Int {
        var count = 0
        var l = 0

        for (r in 1 .. nums.size - 2) {
            if (nums[r] != nums[r + 1] && nums[r] != nums[l]) {
                if (nums[r] > nums[r + 1] == nums[r] > nums[l]) {
                    count++
                    l = r
                }
            }
        }

        return count
    }
}