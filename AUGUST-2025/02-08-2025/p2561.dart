import 'dart:collection';
import 'dart:math';

class Solution {
  int minCost(List<int> basket1, List<int> basket2) {
    final freq = SplayTreeMap<int, int>();
    int m = pow(2, 31).toInt() - 1;

    for (final b1 in basket1) {
      freq[b1] = (freq[b1] ?? 0) + 1;
      m = min(m, b1);
    }
    for (final b2 in basket2) {
      freq[b2] = (freq[b2] ?? 0) - 1;
      m = min(m, b2);
    }

    final merge = <int>[];
    for (final entry in freq.entries) {
      final count = entry.value;
      if (count % 2 != 0) {
        return -1;
      }
      for (int i = 0; i < (count.abs()) ~/ 2; i++) {
        merge.add(entry.key);
      }
    }

    merge.sort();
    int res = 0;
    for (int i = 0; i < merge.length ~/ 2; i++) {
      res += min(2 * m, merge[i]);
    }

    return res;
  }
}