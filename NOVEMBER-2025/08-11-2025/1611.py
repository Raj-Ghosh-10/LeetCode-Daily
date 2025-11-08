#python

class Solution(object):
    def minimumOneBitOperations(self, n):
        count = 0
        while n>0:
            count ^= n
            n >>= 1
        return count


#python3

class Solution:
    def minimumOneBitOperations(self, n: int) -> int:
        ans = 0
        while n:
            ans ^= n
            n >>= 1
        return ans