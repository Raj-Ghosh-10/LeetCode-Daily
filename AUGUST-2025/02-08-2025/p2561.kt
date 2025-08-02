class Solution {
    fun minCost(basket1: IntArray, basket2: IntArray): Long {
        val diff = HashMap<Int, Counter>() // diff between baskets
        var min = Int.MAX_VALUE // min fruit cost overall

        repeat(basket1.size) {
            diff.getOrPut(basket1[it]) { Counter(0) }.count++
            diff.getOrPut(basket2[it]) { Counter(0) }.count--
            min = minOf(min, basket1[it], basket2[it])
        }

        val swap = ArrayList<Int>() // fruits need to be swapped

        for ((cost, counter) in diff) {
            // if the diff is odd, it's impossible
            if (counter.count % 2 != 0) return -1L

            // add half of the surplus to the swap list
            repeat(abs(counter.count) / 2) { swap += cost }
        }

        swap.sort() // to prioritize cheaper swaps

        var result = 0L

        // only need to process half of the swaps, since each swap fixes two items
        repeat(swap.size / 2) { 
            result += minOf(swap[it], min * 2) // choose the cheaper option
        }

        return result
    }
}

class Counter(var count: Int)