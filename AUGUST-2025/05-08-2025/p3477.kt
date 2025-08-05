class Solution {
    fun numOfUnplacedFruits(fruits: IntArray, baskets: IntArray): Int {
        var result = baskets.size
        for (fruit in fruits) {
            for (i in 0 until baskets.size) {
                if (baskets[i] >= fruit) {
                    result--
                    baskets[i] = 0
                    break
                }
            }
        }
        return result
    }
}