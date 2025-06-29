class Solution:
    def numSubseq(self, nums: List[int], target: int) -> int:
        mod = 10**9 + 7
        nums.sort()
        n = len(nums)
        left, right = 0, n - 1
        res = 0

        while left <= right:
            if nums[left] + nums[right] <= target:
                res += pow(2, right - left, mod)
                res %= mod
                left += 1
            else:
                right -= 1

        return res