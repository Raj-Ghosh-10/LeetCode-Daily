class Solution:
    def getNoZeroIntegers(self, n: int) -> List[int]:
        for i in range(1,n):
            a=i
            b=n-i
            if str(a).count('0')==0 and str(b).count('0')==0:
                return [a,b]