class Solution {
  int minSubarray(List<int> nums, int p) {
    int total = nums.reduce((a, b) => a + b);
    int need = total % p;
    if (need == 0) return 0;

    Map<int, int> map = {0: -1};
    int prefix = 0;
    int res = nums.length;

    for (int i = 0; i < nums.length; i++) {
      prefix = (prefix + nums[i]) % p;
      int target = (prefix - need + p) % p;
      if (map.containsKey(target)) res = (res < i - map[target]!) ? res : i - map[target]!;
      map[prefix] = i;
    }

    return (res == nums.length) ? -1 : res;
  }
}