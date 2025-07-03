class Solution {
    fun kthCharacter(k: Int): Char {
        var bitCount = 0
        var k = k - 1
        while (k != 0) {
            bitCount += k and 1
            k = k shr 1
        }
        return 'a' + bitCount
    }
}