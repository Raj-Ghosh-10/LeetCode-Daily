class Solution(object):
    def countValidSelections(self, nums):
        f  = sum(nums)
        ff = 0
        ans = 0
        for i in range(0,len(nums)):
            
            if nums[i] == 0:
                if ff == f or ff-f ==1 or f-ff==1:
                    ans+=1
                    if ff==f:
                        ans+=1
            else:
                ff+=nums[i]
                f-=nums[i]

        return ans