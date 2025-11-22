class Solution {
  int minimumOperations(List<int> nums) {
    int ans = 0;
    for (int x in nums) if (x % 3 != 0) ans++;
    return ans;
  }
}