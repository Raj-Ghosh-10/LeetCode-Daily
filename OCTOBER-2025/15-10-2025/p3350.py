class Solution:
    def maxIncreasingSubarrays(self, nums: List[int]) -> int:
        def check(k):
            prev_increasing = 0
            increasing = 0
            prev = -float("inf")
            for i in range(len(nums)):
                num = nums[i]
                if prev < num:
                    increasing += 1
                else:
                    prev_increasing = increasing
                    increasing = 1
                if prev_increasing >= k and increasing >= k or increasing >= 2*k:
                    return True
                prev = num
            return False
        
        l, r = 0, len(nums) // 2
        ans = 0
        while l <= r:
            mid = (l + r) // 2
            if check(mid):
                ans = mid
                l = mid + 1
            else:
                r = mid - 1
        return ans