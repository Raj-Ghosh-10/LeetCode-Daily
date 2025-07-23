class Solution {
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        var s = Array(s), count = s.count

        func removeMatches(_ pattern:String) -> Int {
            let (a,b) = (pattern.first!, pattern.last!)
            var matchCount = 0, i = 0
            for j in 0..<count {
                let ch = s[j]
                if i>0 && s[i-1] == a && ch == b {
                    i -= 1
                    matchCount += 1
                } else {
                    s[i] = ch
                    i += 1
                }
            }
            count = i
            return matchCount
        }
        let scores = x > y ? [x,y] : [y,x]
        let patterns = x > y ? ["ab","ba"] : ["ba","ab"]
        let matchCounts = patterns.map(removeMatches)
        let dotProduct = zip(scores, matchCounts).map(*).reduce(0,+)
        return dotProduct
    }
}