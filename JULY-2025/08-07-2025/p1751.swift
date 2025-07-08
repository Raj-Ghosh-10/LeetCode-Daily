final class Solution {
    private var dp: [[Int]]
    private var nextIndices: [Int]
    
    init() {
        dp = [[Int]]()
        nextIndices = [Int]()
    }
    
    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        let sortedEvents = events.sorted(by: { $0[0] < $1[0] })
        let n = sortedEvents.count
        nextIndices = [Int](repeating: 0, count: n)

        for curIndex in 0..<n {
            nextIndices[curIndex] = bisectRight(sortedEvents, sortedEvents[curIndex][1])
        }
        dp = Array(repeating: Array(repeating: -1, count: n), count: k + 1)
        return dfs(0, k, sortedEvents)
    }
    
    private func dfs(_ curIndex: Int, _ count: Int, _ events: [[Int]]) -> Int {
        if count == 0 || curIndex == events.count { return 0 }
        if dp[count][curIndex] != -1 { return dp[count][curIndex] }
        
        let nextIndex = nextIndices[curIndex]
        dp[count][curIndex] = max(
            dfs(curIndex + 1, count, events), 
            events[curIndex][2] + dfs(nextIndex, count - 1, events)
        )
        return dp[count][curIndex]
    }
    
    private func bisectRight(_ events: [[Int]], _ target: Int) -> Int {
        var left = 0, right = events.count
        while left < right {
            let mid = (left + right) / 2
            events[mid][0] <= target ? (left = mid + 1) : (right = mid)
        }
        return left
    }
}