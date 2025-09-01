class Solution:
    def maxAverageRatio(self, classes: List[List[int]], extraStudents: int) -> float:
        def getMaxAverage(classes):
            return sum([y/z for (x, [y, z]) in classes])/len(classes)
        
        def gain(_class):
            n, d = _class
            return -(((n+1)/(d+1)) - (n/d))
        heap = [(gain(_class), _class) for _class in classes]
        heapq.heapify(heap)
        
        extraAdded = 0
        filled = []
        while(extraAdded < extraStudents):
            next_class = heapq.heappop(heap)
            # print(next_class)
            start, _class = next_class
            next_class = (gain([_class[0] + 1, _class[1] + 1]), [_class[0] + 1, _class[1] + 1])
            extraAdded += 1
            # print("Added to ", next_class)
            heapq.heappush(heap, next_class)
        return getMaxAverage(heap + filled)
