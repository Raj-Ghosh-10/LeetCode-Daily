class Solution(object):
    def findLHS(self, nums):
        from collections import Counter
        freq = Counter(nums)
        max_len = 0
        for key in freq:
            if key + 1 in freq:
                max_len = max(max_len, freq[key] + freq[key + 1])
        return max_len