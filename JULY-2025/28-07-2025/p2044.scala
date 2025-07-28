object Solution {
    def countMaxOrSubsets(nums: Array[Int]): Int = {
        val maxOr = nums.reduce(_ | _)
        def dfs(i: Int, orVal: Int): Int = {
            if (i == nums.length) if (orVal == maxOr) 1 else 0
            else dfs(i + 1, orVal | nums(i)) + dfs(i + 1, orVal)
        }
        dfs(0, 0)
    }
}