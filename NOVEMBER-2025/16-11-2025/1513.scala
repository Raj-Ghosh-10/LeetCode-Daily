object Solution {
  def numSub(s: String): Int = {
    var sum = 0
    var ones = 0
    s.foreach {
      case '1' =>
        ones += 1
        sum += ones
        sum %= (1e9.toInt + 7)
      case _   =>
        ones = 0
    }
    sum
  }
}