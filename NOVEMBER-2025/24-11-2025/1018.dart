class Solution {
  List<bool> prefixesDivBy5(List<int> nums) {
    List<bool> ans = [];
    int mod = 0;

    for (int bit in nums) {
      mod = (mod * 2 + bit) % 5;
      ans.add(mod == 0);
    }

    return ans;
  }
}