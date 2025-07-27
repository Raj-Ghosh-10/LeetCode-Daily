class Solution {
  int countHillValley(List<int> nums) {
    // slope > 0: uphill
    // slope < 0: downhill
    int res = 0, slope = 0;
    for (int i = 1; i < nums.length; i++){
      if (nums[i] > nums[i - 1]) {
        if (slope < 0) res++;
        slope = 1;
      } else if (nums[i] < nums[i - 1]) {
        if (slope > 0) res++;
        slope = -1;
      }
    }
    return res;
  }
}