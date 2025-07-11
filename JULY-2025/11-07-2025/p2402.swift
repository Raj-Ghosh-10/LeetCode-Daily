class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {

        class Heap<T> {
            private let cmp: (T, T) -> Bool
            private var data = [T]()
            
            var isEmpty: Bool { data.isEmpty }
            var top: T { data.first! }

            init(_ cmp: @escaping (T, T) -> Bool) {
                self.cmp = cmp
            }

            func push(_ i: T) {
                data.append(i)
                shiftUp(data.count - 1)
            }

            func pop() -> T {
                let res = data.first!
                data[0] = data.last!
                data.removeLast()
                shiftDown(0)
                return res
            }

            private func shiftUp(_ i: Int) {
                guard i > 0 else { return }
                let p = (i - 1) / 2
                guard !cmp(data[p], data[i]) else { return }
                data.swapAt(p, i)
                shiftUp(p)
            }

            private func shiftDown(_ i: Int) {
                let l = 2 * i + 1
                let r = 2 * i + 2
                var m = i

                if l < data.count, !cmp(data[m], data[l]) { m = l }
                if r < data.count, !cmp(data[m], data[r]) { m = r }

                guard m != i else { return }
                data.swapAt(m, i)
                shiftDown(m)
            }
        }
        
        let freeRooms = Heap<Int>(<)
        let ends = Heap<[Int]> { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
        var counter = Array(repeating: 0, count: n)

        for r in 0..<n {
            freeRooms.push(r)
        }

        for m in meetings.sorted { $0[0] < $1[0] } {
            
            while !ends.isEmpty, ends.top[0] <= m[0] {
                freeRooms.push(ends.pop()[1])
            }

            if freeRooms.isEmpty {
                let e = ends.pop()
                ends.push([e[0] + m[1] - m[0], e[1]])
                counter[e[1]] += 1
            }
            else {
                let r = freeRooms.pop()
                ends.push([m[1], r])
                counter[r] += 1
            }
        }

        let ma = counter.max()!
        return counter.firstIndex(of: ma)!
    }
}