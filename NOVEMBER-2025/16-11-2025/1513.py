#python

class Solution(object):
    def numSub(self, s):
        """
        :type s: str
        :rtype: int
        """
        lyst = s.split("0")
        cnt = 0
        for i in lyst:
            cnt += len(i)*(len(i)+1)//2
        return cnt %(10**9+7)


#python3

class Solution:
    def numSub(self, s: str) -> int:
        cnt = 0
        for part in s.split('0'):
            n = len(part)
            cnt += n*(n+1)

        return (cnt // 2) % (10**9 + 7)