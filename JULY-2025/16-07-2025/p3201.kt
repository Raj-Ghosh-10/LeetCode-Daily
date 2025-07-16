class Solution {
    fun maximumLength(nums: IntArray): Int {
        var evenCount = 0;
        var oddCount = 0;
        var altCount = 0;
        var lastAlt = -1;

        for (i in 0 until nums.size){
            if (nums[i] % 2 == 0){
                evenCount++;
            }
            else {
                oddCount++;
            }
            if (lastAlt == -1 || nums[lastAlt] % 2 != nums[i] % 2) {
                altCount++;
                lastAlt = i;
            }
        }

        return Math.max(Math.max(evenCount, altCount), oddCount);
    }
}