object Solution {
    def maxSubsequence(nums: Array[Int], k: Int): Array[Int] = {
        nums.zipWithIndex.sortBy(_._1).takeRight(k).sortBy(_._2).map(_._1)
    }
}