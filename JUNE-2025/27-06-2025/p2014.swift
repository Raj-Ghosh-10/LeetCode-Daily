class Solution {
    func longestSubsequenceRepeatedK(_ s: String, _ k: Int) -> String {

        var results = Array(repeating: [String](), count: 8)
        let freq = s.reduce(into: [Character: Int]()) { dict, c in
            dict[c, default: 0] += 1
        }

        let validChars = freq.filter { $0.value >= k }
                             .map { String($0.key) }
                             .sorted()

        results[1] = validChars
        var res = validChars.last ?? ""

        func isValid(_ sub: String) -> Bool {
            let sArr = Array(s)
            let subArr = Array(sub)
            var i = 0
            var j = 0
            var count = 0
            while i < sArr.count && count < k {
                if sArr[i] == subArr[j] {
                    j += 1
                    if j == subArr.count {
                        count += 1
                        j = 0
                    }
                }
                i += 1
            }
            return count == k
        }

        if validChars.isEmpty { return "" }

        for length in 2...7 {
            for prev in results[length - 1] {
                for char in results[1] {
                    let candidate = prev + char
                    if isValid(candidate) {
                        results[length].append(candidate)
                        res = candidate
                    }
                }
            }
        }

        return res
    }
}