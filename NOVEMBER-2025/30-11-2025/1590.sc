object Solution {
    def minSubarray(nums: Array[Int], p: Int): Int = {
        val total = nums.map(_.toLong).sum
        val need = (total % p).toInt
        if (need == 0) return 0

        val map = scala.collection.mutable.Map(0 -> -1)
        var prefix: Long = 0
        var res = nums.length

        for (i <- nums.indices) {
            prefix = (prefix + nums(i)) % p
            val target = ((prefix - need + p) % p).toInt
            if (map.contains(target)) res = math.min(res, i - map(target))
            map(prefix.toInt) = i
        }

        if (res == nums.length) -1 else res
    }
}