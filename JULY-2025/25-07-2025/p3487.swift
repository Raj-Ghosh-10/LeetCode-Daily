class Solution {
    func maxSum(_ nums: [Int]) -> Int {
        let unique = Set(nums)
        let filtered = unique.filter{ $0 > 0}
        return (filtered.isEmpty ? [unique.max()!] : filtered).reduce(0, +)
    }
}