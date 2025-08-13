class Solution {
    fun isPowerOfThree(n: Int) : Boolean {
        if (n < 0 || n == 0) return false
        val x = log(n.toDouble(), 3.0).roundToInt()
        return 3.0.pow(x).toLong() == n.toLong()
    }
}