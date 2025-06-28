class Solution {
  List<int> maxSubsequence(List<int> nums, int k) {
    final arr = List.generate(nums.length, (i) => i)
        ..sort((a, b) => nums[b].compareTo(nums[a]));
    final res = arr.take(k).toList()..sort();
    return res.map((i) => nums[i]).toList();
  }
}