class Solution {
    fun maxSum(nums: IntArray): Int {
        val set = nums.toMutableSet()
        val negs = set.filter { it < 0 }
        
        if (negs.size == set.size) {
            return negs.max()
        } else {
            negs.forEach{set.remove(it)}
            return set.sum()
        }
    }
}