object Solution {
  def maximumGain(s: String, x: Int, y: Int): Int = {
    var score = 0
    val n = s.length

    val (maxStr, minStr) = if (x > y) ("ab", "ba") else ("ba", "ab")

    // First Pass
    val tempFirst = removeSubstring(s, maxStr)
    val removedPairsCount = (n - tempFirst.length) / 2
    score += removedPairsCount * math.max(x, y)

    // Second Pass
    val tempSecond = removeSubstring(tempFirst, minStr)
    val removedPairsCount2 = (tempFirst.length - tempSecond.length) / 2
    score += removedPairsCount2 * math.min(x, y)

    score
  }

  private def removeSubstring(s: String, matchStr: String): String = {
    val stack = scala.collection.mutable.Stack[Char]()

    for (c <- s) {
      if (c == matchStr(1) && stack.nonEmpty && stack.top == matchStr(0)) {
        stack.pop()
      } else {
        stack.push(c)
      }
    }

    stack.toList.reverse.mkString
  }
}