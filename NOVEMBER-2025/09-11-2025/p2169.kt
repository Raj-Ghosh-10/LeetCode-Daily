class Solution {
    fun countOperations(num1: Int, num2: Int): Int {
        var count = 0
        var max = maxOf(num1, num2)
        var min = minOf(num1, num2)
        while (min != 0 && max != 0) {
            count += max / min
            val t = min
            min = max % min
            max = t
        }
        return count
    }
}