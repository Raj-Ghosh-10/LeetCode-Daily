class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
         var i = 0
    while i < bits.count - 1 {
        if bits[i] == 1 {
            i += 2
        } else {
            i += 1
        }
    }
    return i == bits.count - 1
    }
}