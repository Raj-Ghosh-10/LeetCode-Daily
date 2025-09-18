import heapq

class TaskManager:

    def __init__(self, tasks: List[List[int]]):
        self.taskinfo = dict()
        self.heap = []

        for uid, taskid, pri in tasks:
            self.taskinfo[ taskid ] = ( uid, pri )
            heapq.heappush( self.heap , ( -pri, -taskid, taskid ))
        

    def add(self, userId: int, taskId: int, priority: int) -> None:
        self.taskinfo[ taskId ] = ( userId, priority )
        heapq.heappush( self.heap, ( -priority, -taskId, taskId ))
        

    def edit(self, taskId: int, newPriority: int) -> None:
        self.taskinfo[taskId] = (self.taskinfo[taskId][0], newPriority)
        heapq.heappush( self.heap, (-newPriority, -taskId, taskId))

    def rmv(self, taskId: int) -> None:
        del self.taskinfo[taskId]

    def execTop(self) -> int:
        
        while self.heap:
            p, ntid, tid = self.heap[0]

            if tid in self.taskinfo and self.taskinfo[tid][1] == -p:
            
                heapq.heappop( self.heap )
                uid = self.taskinfo[tid][0]
                del self.taskinfo[tid]
                return uid
            else:
                heapq.heappop(self.heap) 

        return -1

# Your TaskManager object will be instantiated and called as such:
# obj = TaskManager(tasks)
# obj.add(userId,taskId,priority)
# obj.edit(taskId,newPriority)
# obj.rmv(taskId)
# param_4 = obj.execTop()