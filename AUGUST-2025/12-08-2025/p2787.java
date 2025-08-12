class Solution {
    int mod = 1000000007;

    int helper(int i,int n, List<Integer> ls, int[][] dp) {
        if(n == 0) return 1;
        if(i >= ls.size() || n < 0) return 0;

        if(dp[i][n] != -1) return dp[i][n];

        // We have 2 option. so as per standard dp,
        // 1. Choose
        // 2. Not choose
        return dp[i][n] = ((helper(i+1, n, ls, dp)%mod) + (helper(i+1, n-ls.get(i), ls, dp)%mod))%mod;
    }

    public int numberOfWays(int n, int x) {
        // Calculating all powers that can be less than n
        List<Integer> ls = new ArrayList();
        for(int i=1;i<301;i++) {
            int val = (int)Math.pow(i, x);
            
            if(val > n) break;
            else ls.add(val);
        }

        // Initializing the dp array with -1 values
        int[][] dp = new int[301][301];
        for(int i=0;i<301;i++) Arrays.fill(dp[i], -1);
        
        return helper(0, n, ls, dp);
    }
}