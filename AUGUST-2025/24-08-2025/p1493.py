class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        c=0
        i=0
        maxi=0
        for j in range(len(nums)):
            if nums[j]==0:
                c+=1
                if c>1:
                    maxi=max(maxi,j-i-1)
                    while c>1:
                        if nums[i]==0:
                            c-=1
                        i+=1
        maxi=max(maxi,j-i)
        return maxi
