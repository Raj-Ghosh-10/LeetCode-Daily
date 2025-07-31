class Solution {
  int subarrayBitwiseORs(List<int> arr) {
    Set<int> res = <int>{};
    Set<int> cur = <int>{};

    for (var num in arr) {
      Set<int> next = <int>{};
      next.add(num);
      for (var x in cur) {
        next.add(x | num);
      }
      cur = next;
      res.addAll(cur);
    }

    return res.length;
  }
}