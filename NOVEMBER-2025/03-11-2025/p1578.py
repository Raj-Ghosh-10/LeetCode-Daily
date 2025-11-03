#python

class Solution(object):
    def minCost(self, colors, neededTime):
        n = len(neededTime)
        curr_c = colors[0]
        curr_max = neededTime[0]
        result = 0
        for i in range(1,n):
            if colors[i] != curr_c:
                curr_c = colors[i]
                curr_max = neededTime[i]
            else:
                if neededTime[i] > curr_max:
                    result += curr_max
                    curr_max = neededTime[i]
                else:
                    result += neededTime[i]
        return result

#python3

