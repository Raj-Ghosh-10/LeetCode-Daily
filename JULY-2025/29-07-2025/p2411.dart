class Solution {
  List<int> smallestSubarrays(List<int> nums) {
    int n = nums.length;
    List<int> lastSeen = List.filled(30, 0);
    List<int> res = List.filled(n, 1);
    for (int i = n - 1; i >= 0; i--) {
      for (int bit = 0; bit < 30; bit++) {
        if ((nums[i] & (1 << bit)) > 0) {
          lastSeen[bit] = i;
        }
        res[i] = res[i] > (lastSeen[bit] - i + 1) ? res[i] : (lastSeen[bit] - i + 1);
      }
    }
    return res;
  }
}