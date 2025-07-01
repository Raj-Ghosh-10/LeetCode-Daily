object Solution {
  def longestSubsequence(s: String, k: Int): Int =
    s.foldRight((0, 0, 1)) { case (c, (count, sum, pow)) =>
      if (sum + pow <= k)
        if (c == '1') (count + 1, sum + pow, pow << 1)
        else (count + 1, sum, pow << 1)
      else if (c == '0') (count + 1, sum, pow)
      else (count, sum, pow)
    }._1
}