class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        let freq = [Int:Int](nums.map{num in (num,1)}, uniquingKeysWith:+)
        var lhsCount = 0
        for (key,value) in freq where freq[key+1] != nil {
            let count = value+freq[key+1]!
            lhsCount = max(lhsCount, count)
        }
        return lhsCount
    }
}