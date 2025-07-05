class Solution {
    func findLucky(_ arr: [Int]) -> Int {
        var frequency: [Int: Int] = [:]
        frequency.reserveCapacity(arr.count)

        for num in arr {
            frequency[num, default: 0] += 1
        }

        var maxLuckyNum = -1
        for num in arr {
            if frequency[num] == num && num > maxLuckyNum {
                maxLuckyNum = num
            }
        }

        return maxLuckyNum
    }
}