class Solution {
    fun totalFruit(fruits: IntArray): Int {
        val freq = IntArray(fruits.size)
        var types = 0
        var result = 0
        var left = 0
        for (right in fruits.indices) {
            if (++freq[fruits[right]] == 1) {
                types++
            }
            while (types > 2) {
                if (--freq[fruits[left]] == 0) {
                    types--
                }    
                left++
            }
            result = maxOf(result, right - left + 1)
        }
        return result
    }
}