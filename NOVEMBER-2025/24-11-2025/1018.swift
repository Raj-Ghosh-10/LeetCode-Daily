class Solution {
    func prefixesDivBy5(_ nums: [Int]) -> [Bool] {
        var ans: [Bool] = []
        var mod = 0

        for bit in nums {
            mod = (mod * 2 + bit) % 5
            ans.append(mod == 0)
        }

        return ans
    }
}