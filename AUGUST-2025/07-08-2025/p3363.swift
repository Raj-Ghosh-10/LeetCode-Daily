
class Solution {
    func maxCollectedFruits(_ fruits: [[Int]]) -> Int {
        let n = fruits.count
        
        var dp = fruits
        
        let middle = n / 2 + n % 2
        
        for i in 1..<n{
            dp[i][i] += dp[i - 1][i - 1]
            
            if i < n - 1{
                let s = middle - abs(middle - i)
                for j in 0...s{
                    if i != n - 1 - j {
                        var leftIndex = max(n - j - 2, n - s)
                        var rightIndex = max(n - j - 1, n - s)
                        var a = max(dp[i - 1][leftIndex], dp[i - 1][rightIndex])
                        dp[i][n - 1 - j] += max(a, dp[i - 1][min(n - j, n - 1)])
                        
                        leftIndex = max(n - j - 2, n - s)
                        rightIndex = max(n - j - 1, n - s)
                        a = max(dp[leftIndex][i - 1], dp[rightIndex][i - 1])
                        dp[n - 1 - j][i] += max(a, dp[min(n - j, n - 1)][i - 1])
                    }
                }
            }
        }
        return dp[n - 1][n - 1] + dp[n - 1][n - 2] + dp[n - 2][n - 1]
        
    }
}