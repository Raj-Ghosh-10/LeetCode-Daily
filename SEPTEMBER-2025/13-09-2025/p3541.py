class Solution:
    def maxFreqSum(self, s: str) -> int:
        count=defaultdict(int)
        vowels=["a","e","i","o","u"]
        maxv=0
        maxc=0
        for i in s:
            count[i]+=1
            if i in vowels:
                maxv=max(maxv,count[i])
            else:
                maxc=max(maxc,count[i])
        return maxv+maxc

        