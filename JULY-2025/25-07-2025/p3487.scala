object Solution {
  def maxSum(nums: Array[Int]): Int = {
    val seen = Array.ofDim[Boolean](201)
    var max = Int.MinValue
    var positiveSum = 0
    nums.foreach { num =>
      if (!seen(num + 100)) {
        seen(num + 100) = true
        max = max max num
        if (num > 0) positiveSum += num
      }
    }
    if (positiveSum > 0) positiveSum
    else max
  }
}