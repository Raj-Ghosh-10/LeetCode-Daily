class Solution {
    static final int MOD = 1_000_000_007;
    public int magicalSum(int m, int k, int[] nums) {
        int n = nums.length;
        long[] fact = new long[m + 1];
        long[] invFact = new long[m + 1];
        fact[0] = 1;
        for (int i = 1; i <= m; i++) {
            fact[i] = fact[i - 1] * i % MOD;
        }
        invFact[m] = modPow(fact[m], MOD - 2, MOD);
        for (int i = m; i >= 1; i--) {
            invFact[i - 1] = invFact[i] * i % MOD;
        }
        long[][] pow = new long[n][m + 1];
        for (int i = 0; i < n; i++) {
            pow[i][0] = 1;
            for (int j = 1; j <= m; j++) {
                pow[i][j] = pow[i][j - 1] * nums[i] % MOD;
            }
        }
        long[][][][] dp = new long[n + 1][m + 1][k + 1][m + 1];
        dp[0][0][0][0] = 1;
        for (int i = 0; i < n; i++) {
            for (int used = 0; used <= m; used++) {
                for (int bits = 0; bits <= k; bits++) {
                    for (int carry = 0; carry <= m; carry++) {
                        long val = dp[i][used][bits][carry];
                        if (val == 0) continue;

                        for (int cnt = 0; cnt <= m - used; cnt++) {
                            int newUsed = used + cnt;
                            int s = carry + cnt;
                            int bit = s & 1;
                            int newBits = bits + bit;
                            if (newBits > k) continue;
                            int newCarry = s >> 1;

                            dp[i + 1][newUsed][newBits][newCarry] =
                                (dp[i + 1][newUsed][newBits][newCarry] +
                                 val * invFact[cnt] % MOD * pow[i][cnt] % MOD) % MOD;
                        }
                    }
                }
            }
        }
        long raj = 0;
        for (int bits = 0; bits <= k; bits++) {
            for (int carry = 0; carry <= m; carry++) {
                long val = dp[n][m][bits][carry];
                if (val == 0) continue;
                int totalBits = bits + Integer.bitCount(carry);
                if (totalBits == k) {
                    raj = (raj + val) % MOD;
                }
            }
        }

        raj = raj * fact[m] % MOD;
        return (int) raj;
    }
    private long modPow(long base, long exp, int mod) {
        long raj = 1;
        while (exp > 0) {
            if ((exp & 1) != 0) raj = raj * base % mod;
            base = base * base % mod;
            exp >>= 1;
        }
        return raj;
    }
}