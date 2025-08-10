class Solution {
    fun reorderedPowerOf2(n: Int): Boolean {
        return n.hash() in hashes
    }
}

val hashes = HashSet<Int>().apply {
    for (i in 0 .. 31) add((1 shl i).hash())
}

fun Int.hash(): Int {
    val freq = IntArray(10)
    var n = this
    while (n > 0) {
        freq[n % 10]++
        n /= 10
    }
    return freq.contentHashCode()
}
        