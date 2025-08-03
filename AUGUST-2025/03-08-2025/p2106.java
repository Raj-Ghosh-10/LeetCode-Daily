class Solution {
    public int maxTotalFruits(int[][] fruits, int startPos, int k) {
        int left = 0;
        int right = 0;
        int n = fruits.length;
        int sum = 0;
        int max = 0;
        while (right < n) {
            sum += fruits[right][1];
            while (left <= right && !isValidRange(fruits[left][0], fruits[right][0], startPos, k)) {
                sum -= fruits[left][1];
                left++;
            }
            max = Math.max(max, sum);
            right++;
        }
        return max;
    }
    private boolean isValidRange(int leftPos, int rightPos, int startPos, int k) {
        if (rightPos <= startPos) {
            return startPos - leftPos <= k;
        } else if (leftPos >= startPos) {
            return rightPos - startPos <= k;
        } else {
            int option1 = (startPos - leftPos) * 2 + (rightPos - startPos);
            int option2 = (startPos - leftPos) + (rightPos - startPos) * 2;
            return Math.min(option1, option2) <= k;
        }
    }
}