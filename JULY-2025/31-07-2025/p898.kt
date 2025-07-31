class Solution {
    fun subarrayBitwiseORs(arr: IntArray): Int {
        return arr.fold(mutableSetOf<Int>() to setOf<Int>()) { (all, current), e ->
            val next = (current.map { it or e } + e).toSet()
            all.addAll(next)
            all to next
        }.first.size
    }
}