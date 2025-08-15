class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        let power = logBase4(Double(n))
        return floor(power) == power ? true : false
    }

    func logBase4(_ value: Double) -> Double {
        return log(value) / log(4.0)
    }
}