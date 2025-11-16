class Solution {
    func numSub(_ s: String) -> Int {
        let MOD = 1_000_000_007
        let s = Array(s)
        var i = 0
        var res = 0
        while i < s.count {
            if s[i] == "1" {
                var start = i
                i += 1
                while i < s.count && s[i] == s[i - 1] {
                    i += 1
                }
                let len = i - start
                res += len * (len + 1) / 2
            } else {
                i += 1
            }
            
        }
        return res % MOD
    }
}