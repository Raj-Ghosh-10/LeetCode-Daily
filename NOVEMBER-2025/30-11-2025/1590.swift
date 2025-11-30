class Solution {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        let total = nums.reduce(0, +)
        let need = total % p
        if need == 0 { return 0 }

        var map = [0: -1]
        var prefix = 0
        var res = nums.count

        for (i, x) in nums.enumerated() {
            prefix = (prefix + x) % p
            let target = (prefix - need + p) % p
            if let idx = map[target] {
                res = min(res, i - idx)
            }
            map[prefix] = i
        }

        return res == nums.count ? -1 : res
    }
}