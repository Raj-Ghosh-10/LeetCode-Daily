import math

class Solution:
    def soupServings(self, n: int) -> float:
        if n == 0:
            return 0.5
        
        # For large n, the probability of soup A being used up before soup B approaches 1.
        # This is because the expected net reduction of soup A is greater than soup B
        # per turn. The maximum number of turns for n=4800 is 4800/25 = 192.
        # The state space for a dynamic programming solution would be
        # approximately (192+4*192)*(192+4*192), which is manageable.
        # For n > 4800, the probability is extremely close to 1.0, and returning 1.0
        # should satisfy the required precision of 10^-5.
        if n >= 4800:
            return 1.0

        # Scale down the problem by a factor of 25 to reduce the state space.
        # The new initial amount is ceil(n/25).
        x = math.ceil(n / 25)
        
        memo = {}
        
        def dp(a, b):
            if (a, b) in memo:
                return memo[(a, b)]
            
            if a <= 0 and b <= 0:
                return 0.5
            if a <= 0:
                return 1.0
            if b <= 0:
                return 0.0
            
            res = 0.25 * (dp(a - 4, b) + dp(a - 3, b - 1) + dp(a - 2, b - 2) + dp(a - 1, b - 3))
            memo[(a, b)] = res
            return res

        return dp(x, x)