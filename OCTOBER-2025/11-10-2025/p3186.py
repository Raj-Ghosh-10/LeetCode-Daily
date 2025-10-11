class Solution:
    def maximumTotalDamage(self, power: List[int]) -> int:
        c = Counter(power)
        k = sorted(c.keys())
        n = len(k)
        
        dp = [k[i] * c[k[i]] for i in range(n)]

        for i in range(1, n):
            j = i - 1
            while j >= 0 and k[i] - k[j] <= 2: j -= 1
            if j >= 0: dp[i] += dp[j]
            dp[i] = max(dp[i], dp[i - 1])
        return dp[n - 1]