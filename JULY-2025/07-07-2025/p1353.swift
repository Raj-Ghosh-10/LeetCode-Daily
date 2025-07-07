class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        let sorted = events.sorted { $0[1] < $1[1] }
        let maxDay = sorted.map { $0[1] }.max() ?? 0
        var attended = [Bool](repeating: false, count: maxDay + 1)
    
        var count = 0
        for event in sorted {
            for day in event[0]...event[1] {
                if !attended[day] {
                    attended[day] = true
                    count += 1
                    break
                }
            }
        }
        return count
    }
}