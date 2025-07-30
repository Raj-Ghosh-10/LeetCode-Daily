class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var maxNum = nums.max(), result = 1, current = 0
        for num in nums {
            if num == maxNum {
                current += 1
            } else {
                result = max(result, current)
                current = 0
            }
        }
        return max(result, current)
    }
}