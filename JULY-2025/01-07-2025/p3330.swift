class Solution {
    func possibleStringCount(_ word: String) -> Int {
        let letters = Array(word)
        let n = letters.count
        var run = 1
        var count = 1
        for i in 1..<n {
            if letters[i] == letters[i - 1] {
                run += 1
            }
            else {
                if run > 1 {
                    count += run - 1
                }
                run = 1
            }
        }
        if run > 1 {
            count += run - 1
        }
        
        return count        
    }
}