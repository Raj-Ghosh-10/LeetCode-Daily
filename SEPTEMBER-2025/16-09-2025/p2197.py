from typing import List
from math import gcd

class Solution:
    def LCM(self, a: int, b: int) -> int:
        return a * b // gcd(a, b)

    def replaceNonCoprimes(self, nums: List[int]) -> List[int]:
        stack = []
        for num in nums:
            while stack and gcd(stack[-1], num) > 1:
                num = self.LCM(stack.pop(), num)
            stack.append(num)  
        return stack