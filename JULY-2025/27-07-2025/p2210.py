class Solution:
    def countHillValley(self, nums: List[int]) -> int:
        prev = nums[0]
        decend = None
        count =0

        p = 1
        while decend == None and p < len(nums):
            if nums[p] > prev:
                decend = False
            elif nums[p] < prev:
                decend = True
            p+=1
        
        del p

        for n in range(1, len(nums)):
            curr = nums[n]

            if curr < prev and not decend:
                count+=1
                decend = True
            elif curr > prev and decend:
                count+=1
                decend = False
            prev = curr
        
        return count