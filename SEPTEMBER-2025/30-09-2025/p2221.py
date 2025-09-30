class Solution:
    def triangularSum(self, nums: List[int]) -> int:
        if(len(nums) == 1):
            return nums[0]
        else:
            newNum = []
            for i in range(len(nums)-1):
                newNum.append((nums[i] + nums[i+1]) % 10)
            return self.triangularSum(newNum)