// characters ascii codes
let lowercaseCodes = UInt8(97)...UInt8(122) // a-z
let uppercaseCodes = UInt8(65)...UInt8(90)  // A-Z
let digitCodes = UInt8(48)...UInt8(57)      // 0-9
let vowelCodes: Set<UInt8> = [65,69,73,79,85,97,101,105,111,117] // aeiouAEIOU

class Solution {
    func isValid(_ word: String) -> Bool
    {
        if word.utf8.count < 3 { return false }

        var hasVowels = false, hasConsonants = false
        for c in word.utf8
        {
            if vowelCodes.contains(c) {
                hasVowels = true
            }
            else if uppercaseCodes.contains(c) || lowercaseCodes.contains(c) {
                hasConsonants = true
            }
            else if !digitCodes.contains(c) {
                return false
            }
        }
        return hasVowels && hasConsonants
    }
}