object Solution {
  def findLHS(nums: Array[Int]): Int = {
    val freq = nums.groupBy(identity).view.mapValues(_.length).toMap
    var ans = 0

    for ((key, value) <- freq) {
      if (freq.contains(key + 1)) {
        ans = math.max(ans, value + freq(key + 1))
      }
    }
    ans
  }
}