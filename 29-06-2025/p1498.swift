class Solution {
    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
         let mod = Int(1e9 + 7)
    let n = nums.count
    var nums = nums.sorted()
    
    var pow2 = [Int](repeating: 1, count: n)
    for i in 1..<n {
        pow2[i] = (pow2[i - 1] * 2) % mod
    }

    var left = 0, right = n - 1
    var result = 0
    
    while left <= right {
        if nums[left] + nums[right] <= target {
            result = (result + pow2[right - left]) % mod
            left += 1
        } else {
            right -= 1
        }
    }
    
    return result
    }
}