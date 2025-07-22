class Solution:
    def maximumUniqueSubarray(self, nums: List[int]) -> int:
        dic = defaultdict(int)
        subsum = 0
        maxsum = -float('inf')
        l = 0
        for num in nums:
            dic[num] += 1
            subsum += num

            while dic[num] > 1:
                dic[nums[l]] -= 1
                subsum -= nums[l]
                l += 1
            maxsum = max(maxsum, subsum)
        return maxsum