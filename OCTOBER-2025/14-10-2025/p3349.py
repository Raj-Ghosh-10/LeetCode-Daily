class Solution:
    def hasIncreasingSubarrays(self, nums: List[int], k: int) -> bool:
        n = len(nums)
        inc, prevInc, maxLen = 1, 0, 0

        for i in range(1, n):
            if nums[i] > nums[i - 1]:
                inc += 1
            else:
                prevInc = inc
                inc = 1

            maxLen = max(maxLen, max(inc >> 1, min(prevInc, inc)))
            if maxLen >= k:
                return True

        return False