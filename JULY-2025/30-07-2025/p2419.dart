class Solution {
  int longestSubarray(List<int> nums) {
    int maxValue = nums.first;
    for (int n in nums) {
      maxValue = max(maxValue, n);
    }

    int curr = 0;
    int maxLengthFound = 0;

    for (int n in nums) {
      if (n == maxValue) {
        curr++;
        maxLengthFound = max(maxLengthFound, curr);
      } else {
        curr = 0;
      }
    }

    return maxLengthFound;
  }
}