class Solution {
    func maxFreeTime(_ eventTime: Int, _ k: Int, _ startTime: [Int], _ endTime: [Int]) -> Int {
        var freeTimes = [Int]()

        var curTime = 0
        for i in 0..<startTime.count {
            // insert 0 to represent no free time
            if i != 0 && startTime[i] == curTime {
                freeTimes.append(0)
            }

            if startTime[i] > curTime {
                freeTimes.append(startTime[i] - curTime)
            }
            curTime = endTime[i]
        }

        if curTime < eventTime {
            freeTimes.append(eventTime - curTime)
        }

        var res = 0

        for i in 0...k {
            guard i < freeTimes.count else { break }
            res += freeTimes[i]
        }

        var l = 0
        var r = k
        var cur = res
        while r < freeTimes.count - 1 {
            cur -= freeTimes[l]
            l += 1
            r += 1
            cur += freeTimes[r]
            res = max(res, cur)
        }

        return res
    }
}