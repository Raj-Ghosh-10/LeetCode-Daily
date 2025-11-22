class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        var ans = 0
        for x in nums { if x % 3 != 0 { ans += 1 } }
        return ans
    }
}