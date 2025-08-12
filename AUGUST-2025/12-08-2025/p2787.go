func numberOfWays(n int, x int) int {
    const mod = 1000000007
    dp := make([]int, n+1)
    dp[0] = 1

    for i:=1; i<=n; i++ {
        pow := 1
        for j := 0; j<x; j++ {
            pow = (pow*i)%mod
        }

        for j:=n; j>=pow; j-- {
            dp[j] = (dp[j]+dp[j-pow])%mod
        }
    }

    return dp[n]
}