class Solution(object):
    def smallestNumber(self, n):
        s = bin(n)[2:]
        s = s.replace('0', '1')
        return int(s, 2)