object Solution {
  def maxTotalFruits(fruits: Array[Array[Int]], startPos: Int, k: Int): Int = {
    def adjustLeft(l: Int, r: Int, sum: Int): (Int, Int) = {
      if (Math.min(startPos - 2 * fruits(l)(0) + fruits(r)(0),
        2 * fruits(r)(0) - fruits(l)(0) - startPos) > k) {
        adjustLeft(l + 1, r, sum - fruits(l)(1))
      } else {
        (l, sum)
      }
    }

    def collectFruits(l: Int, r: Int, sum: Int, maxSum: Int): Int = {
      if (r >= fruits.length || fruits(r)(0) > startPos + k) maxSum
      else {
        val updatedSum = sum + fruits(r)(1)
        val (adjustedL, adjustedSum) = adjustLeft(l, r, updatedSum)
        val updatedMaxSum = Math.max(maxSum, adjustedSum)
        collectFruits(adjustedL, r + 1, adjustedSum, updatedMaxSum)
      }
    }

    val initialL = fruits.indexWhere(fruit => fruit(0) >= startPos - k)
    if (initialL == -1) 0
    else collectFruits(initialL, initialL, 0, 0)
  }
}