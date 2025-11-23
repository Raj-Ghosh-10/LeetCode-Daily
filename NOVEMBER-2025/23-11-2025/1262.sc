object Solution {
    def maxSumDivThree(nums: Array[Int]): Int = {
        var sum = 0

        var m1a = Int.MaxValue
        var m1b = Int.MaxValue
        var m2a = Int.MaxValue
        var m2b = Int.MaxValue

        for (x <- nums) {
            sum += x
            val r = x % 3

            if (r == 1) {
                if (x < m1a) {
                    m1b = m1a
                    m1a = x
                } else if (x < m1b) {
                    m1b = x
                }
            } else if (r == 2) {
                if (x < m2a) {
                    m2b = m2a
                    m2a = x
                } else if (x < m2b) {
                    m2b = x
                }
            }
        }

        val rem = sum % 3
        if (rem == 0) return sum

        var remove = Int.MaxValue

        if (rem == 1) {
            val opt1 = m1a
            val opt2 = if (m2b < Int.MaxValue) m2a + m2b else Int.MaxValue
            remove = math.min(opt1, opt2)
        } else {
            val opt1 = m2a
            val opt2 = if (m1b < Int.MaxValue) m1a + m1b else Int.MaxValue
            remove = math.min(opt1, opt2)
        }

        if (remove == Int.MaxValue) 0 else sum - remove
    }
}