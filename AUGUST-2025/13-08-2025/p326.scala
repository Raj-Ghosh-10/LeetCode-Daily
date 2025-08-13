object Solution {
    def isPowerOfThree(n: Int): Boolean = {
        var res = n
        if (n < 1) return false
        while (res % 3 == 0) res = res / 3
        res == 1
    }
}