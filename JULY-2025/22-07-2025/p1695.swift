class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var seen = Set<Int>()
        seen.reserveCapacity(n)
        
        var left = 0
        var currentSum = 0
        var maxSum = 0
        
        for (right, value) in nums.enumerated() {
            while seen.contains(value) {
                currentSum -= nums[left]
                seen.remove(nums[left])
                left += 1
            }
            currentSum += nums[right]
            seen.insert(value)
            maxSum = max(maxSum, currentSum)
        }
        
        return maxSum        
    }
}