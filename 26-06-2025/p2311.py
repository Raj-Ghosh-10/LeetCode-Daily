class Solution:
    def longestSubsequence(self, s: str, k: int) -> int:
        
        t = f"{k:b}"
        if len(t) > len(s):
            return len(s)
        
        out = s[:-len(t)].count('0')
        remove = 0
        
        for i in range(len(t)):
            c1, c2 = t[i], s[-len(t) + i]
            if c1 == '1' and c2 == '0': # s[:-len(t)] smaller than t
                break
            if c1 == '0' and c2 == '1':  # s[:-len(t) - 1]  <  t  <  s[:-len(t)] 
                remove = 1
                break
                
        return out + len(t) - remove