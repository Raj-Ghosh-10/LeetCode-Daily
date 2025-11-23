class Solution {
    func maxSumDivThree(_ nums: [Int]) -> Int {
        var sum = 0

        var m1a = Int.max, m1b = Int.max
        var m2a = Int.max, m2b = Int.max

        for x in nums {
            sum += x
            let r = x % 3

            if r == 1 {
                if x < m1a {
                    m1b = m1a
                    m1a = x
                } else if x < m1b {
                    m1b = x
                }
            } else if r == 2 {
                if x < m2a {
                    m2b = m2a
                    m2a = x
                } else if x < m2b {
                    m2b = x
                }
            }
        }

        let rem = sum % 3
        if rem == 0 { return sum }

        var remove = Int.max

        if rem == 1 {
            let opt1 = m1a
            let opt2 = (m2b < Int.max) ? m2a + m2b : Int.max
            remove = min(opt1, opt2)
        } else {
            let opt1 = m2a
            let opt2 = (m1b < Int.max) ? m1a + m1b : Int.max
            remove = min(opt1, opt2)
        }

        return remove == Int.max ? 0 : sum - remove
    }
}