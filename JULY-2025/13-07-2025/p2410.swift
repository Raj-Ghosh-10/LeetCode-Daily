class Solution {
    func matchPlayersAndTrainers(_ players: [Int], _ trainers: [Int]) -> Int {
        let players = players.sorted()
        let trainers = trainers.sorted()
        let n = players.count
        let m = trainers.count
        var matches = 0
        var i = 0
        var j = 0
        
        while i < n && j < m {
            if players[i] <= trainers[j] {
                matches += 1
                i += 1
                j += 1
            }
            else { j += 1 }
        }
        
        return matches        
    }
}