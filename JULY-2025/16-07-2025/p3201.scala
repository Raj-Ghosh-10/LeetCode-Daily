object Solution {
  def maximumLength(nums: Array[Int]): Int = {
    val parity = Array.ofDim[Int](3)
    var alternatingParity = nums.head & 1 ^ 1
    nums.map(_ & 1).foreach { p =>
      parity(p) += 1
      if (p != alternatingParity) {
        parity(2) += 1
        alternatingParity ^= 1
      }
    }
    parity.max
  }
}