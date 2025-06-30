class Solution {
  int findLHS(List<int> nums) {
    Map<int, int> freq = {};
    for (int n in nums) {
      freq[n] = (freq[n] ?? 0) + 1;
    }

    int ans = 0;
    for (int key in freq.keys) {
      if (freq.containsKey(key + 1)) {
        ans = max(ans, freq[key]! + freq[key + 1]!);
      }
    }
    return ans;
  }
}