import scala.collection.mutable.Map

object Solution {
  def longestSubsequenceRepeatedK(s: String, k: Int): String = {
    val charCount = s.groupBy(identity).view.mapValues(_.length).toMap
    val candidateChars = charCount.filter(_._2 >= k).keys.toArray.sorted.reverse
    val maxLen = charCount.values.max / k
    
    def isValid(sub: String): Boolean = {
      var count = 0
      var start = 0
      while (count < k) {
        var i = start
        var j = 0
        while (i < s.length && j < sub.length) {
          if (s(i) == sub(j)) j += 1
          i += 1
        }
        if (j == sub.length) {
          count += 1
          start = i
        } else {
          return false
        }
      }
      true
    }
    
    var result = ""
    val used = Map[Char, Int]()
    
    def backtrack(current: String): Unit = {
      if (current.nonEmpty && !isValid(current)) return
      if (current.length > result.length || 
          (current.length == result.length && current > result)) {
        result = current
      }
      
      candidateChars.foreach { c =>
        val usedCount = used.getOrElse(c, 0)
        if (usedCount < maxLen) {
          used(c) = usedCount + 1
          backtrack(current + c)
          used(c) = usedCount
        }
      }
    }
    
    backtrack("")
    result
  }
}