class Solution:
    def maxValue(self, events: List[List[int]], k: int) -> int:
        events.sort()
        
        @cache
        def fn(i,k):
            if i >= len(events):
                return 0
            if k <= 0:
                return 0
            
            s,e,v = events[i]
            nxt = bisect_right(events,[e+1])

            return max(v+fn(nxt,k-1), fn(i+1,k))
        return fn(0,k)