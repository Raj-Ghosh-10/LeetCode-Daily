object Solution {
    def prefixesDivBy5(nums: Array[Int]): List[Boolean] = {
        var mod = 0
        val ans = scala.collection.mutable.ListBuffer[Boolean]()

        for (bit <- nums) {
            mod = (mod * 2 + bit) % 5
            ans += (mod == 0)
        }

        ans.toList
    }
}