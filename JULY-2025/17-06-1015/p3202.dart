import 'dart:math';

class Solution {
  int maximumLength(List<int> nums, int k) {
    int maxLength = 2;

    for (int targetMod = 0; targetMod < k; targetMod++) {
      List<int> remainderDP = List.filled(k, 0);

      for (int num in nums) {
        int numMod = num % k;
        int requiredMod = (targetMod - numMod + k) % k;

        remainderDP[numMod] = remainderDP[requiredMod] + 1;
      }

      for (int length in remainderDP) {
        maxLength = max(maxLength, length);
      }
    }

    return maxLength;
  }
}