class Solution {
  func maxSubsequence(_ nums: [Int], _ k: Int) -> [Int] {
    var storage: [[Int]] = []
    for i in 0..<nums.count {
      storage.append([i, nums[i]])
    }
    storage.sort(by: { $0[1] > $1[1] })
    var storage2: [[Int]] = []
    for i in 0..<k {
      storage2.append(storage[i])
    }
    storage2.sort(by: { $0[0] < $1[0] })
    var result: [Int] = []
    for i in 0..<storage2.count {
      result.append(storage2[i][1])
    }
    return result
  }
}