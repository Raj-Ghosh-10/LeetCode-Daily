class Solution:
    def maxSubsequence(self, nums: List[int], k: int) -> List[int]:
        res = []
        tmp = Counter(sorted(nums, reverse=True)[:k])
        for n in nums:
            if n not in tmp:
                continue
            tmp[n] -= 1
            if tmp[n] == 0:
                del tmp[n]
            res.append(n)
        
        return res