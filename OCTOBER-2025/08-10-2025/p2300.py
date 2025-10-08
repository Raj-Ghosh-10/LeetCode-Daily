class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        potions.sort()
        res=[]
        n=len(potions)
        for spell in spells:
            target=success/spell
            left,right=0,n-1
            while left<=right:
                mid=(left+right)//2
                if potions[mid]>=target:
                    right=mid-1
                else:
                    left=mid+1
            cnt=n-left
            res.append(cnt)
        return res