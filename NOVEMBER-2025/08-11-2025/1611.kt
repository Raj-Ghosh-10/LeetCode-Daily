class Solution {
fun minimumOneBitOperations(n: Int): Int {
    if (n == 0) return 0
    val k = 32 - n.countLeadingZeroBits()
    val r = n - (1 shl (k - 1))
   
    val sub = minimumOneBitOperations(r)
    return (1 shl k) - 1 - sub
}
}