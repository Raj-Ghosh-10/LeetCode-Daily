object Solution {
  def maxFreeTime(eventTime: Int, startTime: Array[Int], endTime: Array[Int]): Int = {
    val n = startTime.length
    if (n == 0) return eventTime

    val gaps = Array.ofDim[Int](n + 1)
    gaps(0) = startTime(0)
    for (i <- 1 until n) {
      gaps(i) = startTime(i) - endTime(i - 1)
    }
    gaps(n) = eventTime - endTime(n - 1)

    val largestRight = Array.ofDim[Int](n + 1)
    for (i <- (0 until n).reverse) {
      largestRight(i) = math.max(largestRight(i + 1), gaps(i + 1))
    }

    var maxFree = 0
    var largestLeft = 0

    for (i <- 1 to n) {
      val duration = endTime(i - 1) - startTime(i - 1)
      val canFitLeft = largestLeft >= duration
      val canFitRight = largestRight(i) >= duration

      if (canFitLeft || canFitRight) {
        val merged = gaps(i - 1) + gaps(i) + duration
        maxFree = math.max(maxFree, merged)
      }

      val current = gaps(i - 1) + gaps(i)
      maxFree = math.max(maxFree, current)
      largestLeft = math.max(largestLeft, gaps(i - 1))
    }

    maxFree
  }
}