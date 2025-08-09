class Solution {
    fun isPowerOfTwo(n: Int): Boolean {
        // Negative numbers, zero, and odd numbers (other than 1) cannot be powers of two
        if (n <= 0) return false
        
        // A number is a power of two if it has only one '1' bit in its binary form.
        // This property can be checked using (n & (n - 1)) == 0
        return (n and (n - 1)) == 0
    }
}