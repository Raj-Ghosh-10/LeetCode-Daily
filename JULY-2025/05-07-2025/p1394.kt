class Solution {
    fun findLucky(arr: IntArray): Int {
        val freq = IntArray(501)
        for (num in arr) {
            freq[num]++
        }

        var result = -1
        for (num in arr) {
            if (freq[num] == num) {
                result = maxOf(result, num)
            }
        }
        return result
    }
}