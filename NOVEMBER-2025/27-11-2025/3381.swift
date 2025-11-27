class Solution {
    func maxSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        let INF: Int64 = Int64.max
        var minPrefix = Array(repeating: INF, count: k)
        minPrefix[0] = 0

        var prefix: Int64 = 0
        var answer: Int64 = Int64.min

        for i in 0..<nums.count {
            prefix += Int64(nums[i])
            let mod = (i + 1) % k

            if minPrefix[mod] != INF {
                let candidate = prefix - minPrefix[mod]
                if candidate > answer {
                    answer = candidate
                }
            }

            if prefix < minPrefix[mod] {
                minPrefix[mod] = prefix
            }
        }

        return Int(answer)
    }
}