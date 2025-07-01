class Solution {
    fun possibleStringCount(word: String): Int {
        var count = 0
        var prev = '0'
        for (w in word) {
            if (prev == w) count++
            prev = w
        }
        return count + 1
    }
}