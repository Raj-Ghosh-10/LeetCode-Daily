class Solution {
    fun isOneBitCharacter(bits: IntArray): Boolean {
        var i = 0
        while (true) {
            val bit = bits[i]
            if (bit == 0) {
                i++
                if (i == bits.size) {
                    return true
                }
            } else {
                i += 2
                if (i >= bits.size) {
                    return false
                }
            }
        }
    }
}