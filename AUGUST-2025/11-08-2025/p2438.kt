class Solution {
    private val MODULO = 1_000_000_007L

    fun productQueries(n: Int, queries: Array<IntArray>): IntArray {      
        var index = 0
        var current = n
        var lastSum = 0
        val prefixSum = mutableListOf(0)
        while (current != 0) {
            if (current and 1 == 1) {
                prefixSum.add(lastSum + index)
                lastSum += index
            } 
            current = current shr 1
            index++
        }

        return IntArray(queries.size) { i ->
            var power = prefixSum[queries[i][1] + 1] - prefixSum[queries[i][0]]
            var result = 1L
            var base = 2L
            while (power > 0) {
                if (power and 1 == 1) {
                    result = (result * base) % MODULO
                }
                base = (base * base) % MODULO
                power = power shr 1
            }
            result.toInt()
        }
    }
}