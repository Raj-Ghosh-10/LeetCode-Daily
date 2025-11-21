class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        var first = Array(repeating: -1, count: 26)
        var last = Array(repeating: -1, count: 26)

        for i in 0..<n {
            let c = Int(chars[i].asciiValue! - 97)
            if first[c] == -1 { first[c] = i }
            last[c] = i
        }

        var ans = 0

        for c in 0..<26 {
            if first[c] != -1 && last[c] - first[c] > 1 {
                var mask = 0
                for i in (first[c] + 1)..<last[c] {
                    let mid = Int(chars[i].asciiValue! - 97)
                    mask |= 1 << mid
                }
                ans += mask.nonzeroBitCount
            }
        }

        return ans
    }
}