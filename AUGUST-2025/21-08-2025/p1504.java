class Solution {
    public int numSubmat(int[][] mat) {
        int rows = mat.length;
        int cols = mat[0].length;

        int[] heights = new int[cols];
        int total = 0;

        for (int i = 0; i < rows; i++) {
            // Update the heights array in-place for current row
            for (int j = 0; j < cols; j++) {
                heights[j] = mat[i][j] == 0 ? 0 : heights[j] + 1;
            }

            // Pass the same updated height to the histogram method
            total += countFromHistogram(heights);
        }

        return total;
    }

    private int countFromHistogram(int[] height) {
        int len = height.length;
        Stack<Integer> stack = new Stack<>();
        int[] dp = new int[len];
        int res = 0;

        for (int j = 0; j < len; j++) {
            while (!stack.isEmpty() && height[stack.peek()] >= height[j]) {
                stack.pop();
            }

            if (stack.isEmpty()) {
                dp[j] = height[j] * (j + 1);
            } else {
                int prevIndex = stack.peek();
                dp[j] = dp[prevIndex] + height[j] * (j - prevIndex);
            }

            res += dp[j];
            stack.push(j);
        }

        return res;
    }
}