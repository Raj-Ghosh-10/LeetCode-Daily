class Solution {
  int maxSubarraySum(List<int> nums, int k) {
    List<int> minPrefix = List.filled(k, 1 << 60);
    minPrefix[0] = 0;

    int prefix = 0;
    int answer = -1 << 60;

    for (int i = 0; i < nums.length; i++) {
      prefix += nums[i];
      int mod = (i + 1) % k;

      answer = (prefix - minPrefix[mod] > answer) ? prefix - minPrefix[mod] : answer;
      minPrefix[mod] = (prefix < minPrefix[mod]) ? prefix : minPrefix[mod];
    }

    return answer;
  }
}