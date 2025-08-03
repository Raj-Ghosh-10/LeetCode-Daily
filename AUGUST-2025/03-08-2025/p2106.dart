class Solution {
  int maxTotalFruits(List<List<int>> fruits, int startPos, int k) {
    int n = fruits.length;
    int maxFruits = 0, windowSum = 0;
    int left = 0;

    for (int right = 0; right < n; right++) {
      windowSum += fruits[right][1];

      while (left <= right) {
        int leftPos = fruits[left][0];
        int rightPos = fruits[right][0];

        int directLeft = (startPos - leftPos).abs();
        int directRight = (startPos - rightPos).abs();
        int totalWidth = rightPos - leftPos;
        int minCost = (directLeft < directRight ? directLeft : directRight) + totalWidth;

        if (minCost <= k) break;

        windowSum -= fruits[left][1];
        left++;
      }

      if (windowSum > maxFruits) maxFruits = windowSum;
    }

    return maxFruits;
  }
}