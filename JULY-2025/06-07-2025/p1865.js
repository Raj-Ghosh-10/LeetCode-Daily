var FindSumPairs = function(nums1, nums2) {
    this.nums1 = nums1;
    this.nums2 = nums2;
    this.freqMap = new Map();

    for (let num of nums2) {
        this.freqMap.set(num, (this.freqMap.get(num) || 0) + 1);
    }
};

FindSumPairs.prototype.add = function(index, val) {
    const oldVal = this.nums2[index];
    const newVal = oldVal + val;

    // Update frequency map
    this.freqMap.set(oldVal, this.freqMap.get(oldVal) - 1);
    if (this.freqMap.get(oldVal) === 0) {
        this.freqMap.delete(oldVal);
    }

    this.nums2[index] = newVal;
    this.freqMap.set(newVal, (this.freqMap.get(newVal) || 0) + 1);
};

FindSumPairs.prototype.count = function(tot) {
    let count = 0;
    for (let num of this.nums1) {
        let complement = tot - num;
        if (this.freqMap.has(complement)) {
            count += this.freqMap.get(complement);
        }
    }
    return count;
};