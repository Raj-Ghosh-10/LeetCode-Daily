object Solution {
    def isPowerOfTwo(n: Int): Boolean = {
        if (n == 1 || n == 2) true
        else if (n == 0 || (n & 1) == 1) false
        else isPowerOfTwo(n >> 1)
    }
}