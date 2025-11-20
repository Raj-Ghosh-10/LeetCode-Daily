object Solution {
    def intersectionSizeTwo(intervals: Array[Array[Int]]): Int = {
        val sorted = intervals.sortBy(_(1))
        var prev1 = sorted(0)(1) - 1
        var prev2 = sorted(0)(1)
        var count = 2
        for (i <- 1 until sorted.length) {
            val start = sorted(i)(0)
            val end   = sorted(i)(1)
            if (prev2 < start) {
                prev1 = end - 1
                prev2 = end
                count += 2
            }
            else if (prev1 < start) {
                if (end == prev2) {
                    prev1 = end - 1
                } else {
                    prev1 = end
                }
                if (prev1 > prev2) {
                    val temp = prev1
                    prev1 = prev2
                    prev2 = temp
                }
                count += 1
            }
        }
        count
    }
}