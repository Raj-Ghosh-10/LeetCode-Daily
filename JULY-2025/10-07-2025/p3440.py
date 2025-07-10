class Solution:
    def maxFreeTime(self, eventTime: int, startTime: List[int], endTime: List[int]) -> int:
        N = len(startTime)
        freeTimes = []
        eventLengths = []
        maxFreeTimes = []
        prevEnd = 0
        for i in range(N):
            curStart, curEnd = startTime[i], endTime[i]
            heapq.heappush(maxFreeTimes, curStart-prevEnd)
            if len(maxFreeTimes) > 3:
                heapq.heappop(maxFreeTimes)
            freeTimes.append(curStart-prevEnd)
            eventLengths.append(curEnd-curStart)
            prevEnd = curEnd
        freeTimes.append(eventTime-prevEnd)
        heapq.heappush(maxFreeTimes, eventTime-prevEnd)
        if len(maxFreeTimes) > 3:
            heapq.heappop(maxFreeTimes)
        def canRescheduleEventElsewhere(eventIdx):
            eventLength = eventLengths[eventIdx]
            free1, free2 = freeTimes[eventIdx], freeTimes[eventIdx+1]
            for time in maxFreeTimes:
                if time == free1 or time == free2:
                    if time == free1:
                        free1 = -1
                    elif time == free2:
                        free2 = -1
                elif time >= eventLength:
                    return True
            return False
                
        maxFreeTime = 0
        for i in range(N):
            if canRescheduleEventElsewhere(i):
                maxFreeTime = max(maxFreeTime, eventLengths[i]+freeTimes[i]+freeTimes[i+1])
            maxFreeTime = max(maxFreeTime, freeTimes[i]+freeTimes[i+1])
        
        return maxFreeTime