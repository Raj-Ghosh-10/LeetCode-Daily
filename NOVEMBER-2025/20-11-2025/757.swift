class Solution {
    func intersectionSizeTwo(_ intervals: [[Int]]) -> Int {
        let intervals = intervals.sorted { $0[1] < $1[1] }
        
        var prev1 = intervals[0][1] - 1
        var prev2 = intervals[0][1]
        var count = 2
        for i in 1..<intervals.count {
            let start = intervals[i][0]
            let end = intervals[i][1]
            if prev2 < start {
                prev1 = end - 1
                prev2 = end
                count += 2
            }
            else if prev1 < start {
                if end == prev2 {
                    prev1 = end - 1
                } else {
                    prev1 = end
                }
                if prev1 > prev2 {
                    (prev1, prev2) = (prev2, prev1)
                }
                count += 1
            }
        }
        return count
    }
}