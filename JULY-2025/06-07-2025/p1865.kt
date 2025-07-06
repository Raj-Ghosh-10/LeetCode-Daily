class FindSumPairs(nums1: IntArray, val nums2: IntArray) {
    
    //create a frequency map for nums1
    private val freq1: Map<Number, OccurrenceCount> = nums1.toList().groupingBy { it }.eachCount()

    fun add(index: Int, value: Int) {
        nums2[index] += value
    }

    //search for the complement of num in nums2. 
    fun count(tot: Int): Int {
        var count = 0
        for (num in nums2) {
            if (freq1.contains(tot - num)) {
                count += freq1[tot - num]!!
            }
        }
        return count
    }
}

typealias Number = Int
typealias OccurrenceCount = Int


/**
 * Your FindSumPairs object will be instantiated and called as such:
 * var obj = FindSumPairs(nums1, nums2)
 * obj.add(index,`val`)
 * var param_2 = obj.count(tot)
 */