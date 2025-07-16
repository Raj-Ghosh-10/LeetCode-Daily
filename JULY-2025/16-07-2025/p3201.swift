class Solution {
    func maximumLength(_ nums: [Int]) -> Int {
        var evenLen = 0, oddLen = 0, altLen = 0, altParity = -1
        for num in nums {
            if num % 2 == 0 {
                evenLen += 1
                if altParity != 0 { altLen += 1 }
            } else {
                oddLen += 1
                if altParity != 1 { altLen += 1 }
            }
            altParity = num % 2
        }
        return max(evenLen, oddLen, altLen)
    }
}