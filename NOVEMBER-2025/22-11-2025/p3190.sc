object Solution {
    def minimumOperations(nums: Array[Int]): Int = {
        nums.count(_ % 3 != 0)
    }
}