class Solution {
    func countOperations(_ num1: Int, _ num2: Int) -> Int {
        var first = num1
        var second = num2
        var count = 0 
        while first != 0 && second != 0 {
            if first == second {
                count += 1
                return count
            } else if first > second {
                count += 1
                first = first - second
            } else {
                count += 1
                second = second - first
            }
        }
        return count
    }
}