class Solution {
    func makeFancyString(_ s: String) -> String {
        let letters = Array(s)
        var ans = [Character]()
        for letter in letters {
            let count = ans.count
            if count < 2 || !(ans[count - 1] == ans[count - 2] && ans[count - 1] == letter) {
                ans.append(letter)
            }
        }
        return String(ans)        
    }
}