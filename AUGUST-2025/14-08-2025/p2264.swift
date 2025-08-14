class Solution {
    func largestGoodInteger(_ num: String) -> String {
        var curr: Array<Character> = ["x", "y", "?"]
        var ans = -1

        for c in num {
            curr[0] = curr[1]
            curr[1] = curr[2]
            curr[2] = c
            
            if curr[0] == curr[1] && curr[1] == curr[2] && Int(String(curr[0]))! > ans {
                ans = Int(String(curr[0]))!
            }
        }
        
        if ans != -1 {
            return String(repeating: String(ans), count: 3)
        }
        
        return ""
    }
}