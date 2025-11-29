class Solution:
    def minOperations(self, nums: List[int], k: int) -> int:
        return sum(nums) % k




class Solution(object):
    def minOperations(self, nums, k):
        return sum(nums) % k