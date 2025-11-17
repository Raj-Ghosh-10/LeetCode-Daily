#python
class Solution(object):
    def kLengthApart(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: bool
        """
        prev = -1

        for i, val in enumerate(nums):
            if val == 1:
                if prev != -1 and (i - prev - 1) < k:
                    return False
                prev = i

        return True

#python3

class Solution:
    def kLengthApart(self, nums: List[int], k: int) -> bool:
        if k == 0:
            return True
        prev = None
        for i, num in enumerate(nums):
            if num == 1:
                if prev is not None and i - prev <= k:
                    return False
                prev = i
        return True