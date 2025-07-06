class FindSumPairs {
    private var nums2: [Int]
    private var nums1Counts: [Int: Int]
    private var nums2Counts: [Int: Int]

    init(_ nums1: [Int], _ nums2: [Int]) {
        self.nums2 = nums2
        nums1Counts = nums1.reduce(into: [:]) { partialResult, num in
            partialResult[num, default: .zero] += 1
        }
        nums2Counts = nums2.reduce(into: [:]) { partialResult, num in
            partialResult[num, default: .zero] += 1
        }
    }

    func add(_ index: Int, _ val: Int) {
        nums2Counts[nums2[index]]! -= 1
        nums2[index] += val
        nums2Counts[nums2[index], default: .zero] += 1
    }

    func count(_ tot: Int) -> Int {
        var result: Int = .zero
        for (num1, count1) in nums1Counts where tot > num1 {
            if let count2 = nums2Counts[tot - num1] {
                result += count1 * count2
            }
        }

        return result
    }
}

/**
 * Your FindSumPairs object will be instantiated and called as such:
 * let obj = FindSumPairs(nums1, nums2)
 * obj.add(index, val)
 * let ret_2: Int = obj.count(tot)
 */