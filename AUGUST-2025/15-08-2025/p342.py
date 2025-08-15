import math

class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        # complexity O(1) since only math functions are used
        if n <= 0:
            return False
        return math.log(n, 4) % 1 == 0