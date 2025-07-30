object Solution {
  def longestSubarray(nums: Array[Int]): Int = {
    var maxVal = nums(0)
    var maxLen = 1
    var currentLen = 1
    var i = 1
    
    while (i < nums.length) {
      val num = nums(i)
      if (num > maxVal) {
        maxVal = num
        maxLen = 1
        currentLen = 1
      } else if (num == maxVal) {
        currentLen += 1
        if (currentLen > maxLen) maxLen = currentLen
      } else {
        currentLen = 0
      }
      i += 1
    }
    
    maxLen
  }
}