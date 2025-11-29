class Solution {
  int minOperations(List<int> nums, int k) {
    int sum = 0;
    for (int x in nums) sum += x;
    return sum % k;
  }
}