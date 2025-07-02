import Foundation

class Solution {
    let MOD = 1_000_000_007

    @inline(__always)
    func modMul(_ a: Int, _ b: Int) -> Int {
        return Int((Int64(a) * Int64(b)) % Int64(MOD))
    }

    @inline(__always)
    func modAdd(_ a: Int, _ b: Int) -> Int {
        let sum = a + b
        return sum >= MOD ? sum - MOD : sum
    }

    @inline(__always)
    func modSub(_ a: Int, _ b: Int) -> Int {
        let diff = a - b
        return diff < 0 ? diff + MOD : diff
    }

    func possibleStringCount(_ word: String, _ k: Int) -> Int {
        let chars = Array(word)
        var segs = [1]

        // Build segments of consecutive characters
        for i in 1..<chars.count {
            if chars[i] == chars[i - 1] {
                segs[segs.count - 1] += 1
            } else {
                segs.append(1)
            }
        }

        let segmentCount = segs.count
        var total = 1
        for s in segs {
            total = modMul(total, s)
        }

        if k <= segmentCount {
            return total
        }

        // DP: dp[j] = # of ways to build string of length j with first i blocks
        var dp = [Int](repeating: 0, count: k)
        dp[0] = 1

        for i in 0..<segmentCount {
            let maxAdd = segs[i]
            var prefix = [Int](repeating: 0, count: k + 1)
            for j in 0..<k {
                prefix[j + 1] = modAdd(prefix[j], dp[j])
            }

            var newDP = [Int](repeating: 0, count: k)
            for j in (i + 1)..<k {
                let left = max(0, j - maxAdd)
                newDP[j] = modSub(prefix[j], prefix[left])
            }
            dp = newDP
        }

        // Sum of all dp[j] where j >= segmentCount and < k
        var lessThanK = 0
        for val in dp {
            lessThanK = modAdd(lessThanK, val)
        }

        return modSub(total, lessThanK)
    }
}