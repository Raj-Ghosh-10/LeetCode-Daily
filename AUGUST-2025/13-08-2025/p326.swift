class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        String(n, radix: 3)
            .enumerated()
            .allSatisfy { $0.element == ($0.offset == 0 ? "1": "0") }
    }
}