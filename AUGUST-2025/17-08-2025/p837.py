class Solution:
    def new21Game(self, n: int, k: int, maxPts: int) -> float:
        if k == 0 or n >= k - 1 + maxPts:
            return 1.0
        p = [0.0] * (n + 1)
        p[0] = 1.0
        win = 1.0  
        ans = 0.0

        for i in range(1, n + 1):
            p[i] = win / maxPts
            if i < k:
                win += p[i]
            else:
                ans += p[i]
            left = i - maxPts
            if 0 <= left < k:
                win -= p[left]

        return ans