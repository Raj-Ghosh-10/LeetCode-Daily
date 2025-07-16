class Solution {
    public int maximumLength(int[] nums) {

        int n = nums.length;
        int[][][] dp = new int[nums.length + 1][3][2];

        for(int i = n-1 ; i >= 0 ; i--) {
            for(int prevElementParity = 0 ; prevElementParity <= 2 ; prevElementParity++) {
                for(int parity = 0 ; parity <= 1 ; parity++) {
                    int notTake = dp[i+1][prevElementParity][parity];
                    int take = 0;
                    int currElementParity = nums[i]%2 + 1;

                    if(prevElementParity == 0) {
                        take = 1 + dp[i+1][currElementParity][parity];
                    } else if (((parity == 1) && (currElementParity != prevElementParity)) || ((parity == 0) && (currElementParity == prevElementParity))) {
                        take = 1 + dp[i+1][currElementParity][parity];
                    }
                    dp[i][prevElementParity][parity] = Math.max(take, notTake);
                }
            }
        }

        return Math.max(dp[0][0][0], dp[0][0][1]);
    }

    public int maximumLengthMemoized(int[] nums, int index, int prevElementParity, int parity, int[][][] dp) {
        if(index == nums.length) {
            return 0;
        }

        if(dp[index][prevElementParity+1][parity] != -1) {
            return dp[index][prevElementParity+1][parity];
        }

        int maxLen = 0;

        int notTake = maximumLengthMemoized(nums, index+1, prevElementParity, parity, dp);
        int take = 0;

        if(prevElementParity == -1) {
            take = 1 + maximumLengthMemoized(nums, index+1, nums[index] % 2, parity, dp);
        } else if (((parity == 1) && (nums[index]%2 != prevElementParity)) || ((parity == 0) && (nums[index]%2 == prevElementParity))) {
            take = 1 + maximumLengthMemoized(nums, index+1, nums[index] % 2, parity, dp);
        }

        return dp[index][prevElementParity+1][parity] = Math.max(take, notTake);
    }
}
    