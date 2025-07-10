class Solution:
    def maxFreeTime(self, eventTime: int, k: int, startTime: List[int], endTime: List[int]) -> int:
        lst = []
        start = 0
        startTime.append(eventTime)
        endTime.append(eventTime)
        for i in range(len(startTime)):
            lst.append(startTime[i] - start)
            start = endTime[i]
        
        cur = sum(lst[:k + 1])
        ans = cur
        for i in range(k + 1, len(lst)):
            cur = cur + (lst[i] - lst[i - k - 1])
            ans = max(ans, cur)
        return ans
        
            

        