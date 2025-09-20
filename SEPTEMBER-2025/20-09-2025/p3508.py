from collections import deque, defaultdict
import bisect
class Router:

    def __init__(self, memoryLimit: int):
        self.memLimit = memoryLimit
        self.packet = deque([])
        self.keys = {}
        self.des = defaultdict(list)
        self.len = 0

    def addPacket(self, source: int, destination: int, timestamp: int) -> bool:
        if (source, destination, timestamp) in self.keys:
            return False
        else:
            if self.len >= self.memLimit:
                self.forwardPacket()
            self.packet.append( (source, destination, timestamp) )
            self.keys[(source, destination, timestamp)] = 1
            self.des[destination].append(timestamp)
            self.len += 1
            return True

    def forwardPacket(self) -> List[int]:
        if self.packet:
            pack = self.packet.popleft()
            self.des[pack[1]].pop(0)
            self.keys.pop(pack)
            self.len -= 1
            return pack
        else:
            return []

    def getCount(self, destination: int, startTime: int, endTime: int) -> int:
        times = self.des[destination]
        if not times:
            return 0
        left = bisect.bisect_left(times, startTime)
        right = bisect.bisect_right(times, endTime)
        return right - left


# Your Router object will be instantiated and called as such:
# obj = Router(memoryLimit)
# param_1 = obj.addPacket(source,destination,timestamp)
# param_2 = obj.forwardPacket()
# param_3 = obj.getCount(destination,startTime,endTime)