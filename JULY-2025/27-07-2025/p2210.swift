class Solution {
    func countHillValley(_ nums: [Int]) -> Int {
        nums
            .chunked(by: ==)
            .compactMap(\.first)
            .windows(ofCount: 3)
            .map(Array.init)
            .count { $0[1] < min($0[0], $0[2]) || $0[1] > max($0[0], $0[2]) }
    }
}