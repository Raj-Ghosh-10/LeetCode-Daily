class Solution {
    fun minSubarray(nums: IntArray, p: Int): Int {
        val total = nums.fold(0L) { acc, x -> acc + x }
        val need = (total % p).toInt()
        if (need == 0) return 0

        val map = mutableMapOf(0 to -1)
        var prefix = 0L
        var res = nums.size

        for (i in nums.indices) {
            prefix = (prefix + nums[i]) % p
            val target = ((prefix - need + p) % p).toInt()
            if (map.containsKey(target)) res = minOf(res, i - map[target]!!)
            map[prefix.toInt()] = i
        }

        return if (res == nums.size) -1 else res
    }
}