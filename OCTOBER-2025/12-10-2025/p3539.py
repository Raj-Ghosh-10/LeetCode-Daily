class Solution(object):
    def magicalSum(self, M, K, nums):
        """
        :type M: int
        :type K: int
        :type nums: List[int]
        :rtype: int
        """
        MOD = 10**9 + 7

        choose = [[0] * 31 for _ in range(31)]
        for n in range(31):
            choose[n][0] = choose[n][n] = 1
            for k in range(1, n):
                choose[n][k] = choose[n - 1][k] + choose[n - 1][k - 1]

        dp = [[[0] * 16 for _ in range(31)] for _ in range(31)]
        dp[0][0][0] = 1  # base case

        for num in nums:
            for length in range(M, -1, -1):
                power = 1
                for added in range(1, M - length + 1):
                    power = power * num % MOD
                    value = power * choose[length + added][added] % MOD
                    for bits in range(length, -1, -1):
                        for overflow in range((length - bits) // 2 + 1):
                            tail_bits = added + overflow
                            new_bits = bits + (tail_bits & 1)
                            new_overflow = tail_bits >> 1
                            dp[length + added][new_bits][new_overflow] = (
                                dp[length + added][new_bits][new_overflow] +
                                dp[length][bits][overflow] * value % MOD
                            ) % MOD

                for bits in range(length, -1, -1):
                    for overflow in range(1, (length - bits) // 2 + 1):
                        new_bits = bits + (overflow & 1)
                        new_overflow = overflow >> 1
                        dp[length][new_bits][new_overflow] = (
                            dp[length][new_bits][new_overflow] +
                            dp[length][bits][overflow]
                        ) % MOD
                        dp[length][bits][overflow] = 0

        total = 0
        for overflow in range(M // 2 + 1):
            overflow_bits = bin(overflow).count('1')
            if overflow_bits <= K:
                total = (total + dp[M][K - overflow_bits][overflow]) % MOD

        return total