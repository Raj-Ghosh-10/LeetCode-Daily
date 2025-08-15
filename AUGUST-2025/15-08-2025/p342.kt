class Solution {
    fun isPowerOfFour(n: Int): Boolean {
        var n = n
        if (n and 0xFFFF == 0) {
            n = n shr 16
        }
        if (n and 0xFF == 0) {
            n = n shr 8
        }
        if (n and 0x0F == 0) {
            n = n shr 4
        }
        return n == 1 || n == 4 
    }
}