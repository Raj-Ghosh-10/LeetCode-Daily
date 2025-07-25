class Solution {
    public int maxSum(int[] nums) {
        Set<Integer> uniquePositives = new HashSet<>();
        int maximumSum = 0;
        int maxNegative = -101;

        for (int num : nums) {
            if (num <= 0 ) {
                if (num > maxNegative) {
                    maxNegative = num;
                }
                continue;
            }
            if (uniquePositives.add(num)) {
                maximumSum += num;
            }
        }

        return maximumSum > 0 ? maximumSum : maxNegative;
    }
}