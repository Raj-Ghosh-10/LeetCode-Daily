from functools import cache
from typing import List

class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        N = len(triangle)

        @cache
        def helper(x, y):
            # Base case: reached the last row
            if x == N - 1:
                return triangle[x][y]
            
            # Recursive case: current value + minimum of two possible paths
            return triangle[x][y] + min(helper(x + 1, y), helper(x + 1, y + 1))
            
        return helper(0, 0)