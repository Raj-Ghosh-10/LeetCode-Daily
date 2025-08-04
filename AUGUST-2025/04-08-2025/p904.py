class Solution:
    def totalFruit(self, fruits: List[int]) -> int:
        myset = []
        count = 0
        lastCons = 1
        maxi = 0
        for i in range(len(fruits)):


            if(fruits[i] not in myset):
                if len(myset)<2:
                    myset.append(fruits[i])
                    count+=1
                else:
                    count=lastCons+1
                    if myset[0] != fruits[i-1]:
                        myset[0] = fruits[i]
                    else:
                        myset[1] = fruits[i]
            else:
                count+=1
                
            if(i>0 and fruits[i]==fruits[i-1]): lastCons+=1
            else: lastCons = 1

            maxi = max(maxi, count)

        return maxi