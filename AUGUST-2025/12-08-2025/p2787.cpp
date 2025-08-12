class Solution {
public:
    static const int MOD = 1e9 + 7;
    vector<vector<int>> dp;

    int power(int a, int b, int limit) {
        long long res = 1;
        for (int i = 0; i < b; i++) {
            res *= a;
            if (res > limit) return limit + 1;
        }
        return (int)res;
    }

    int recursive(int n, int x, int i) {
        if (n == 0) return 1;
        if (i > n) return 0;

        if (dp[n][i] != -1) return dp[n][i];

        int num = power(i, x, n);
        int take = 0;
        if (n >= num) {
            take = recursive(n - num, x, i + 1);
        }
        int skip = recursive(n, x, i + 1);

        return dp[n][i] = (take + skip) % MOD;
    }

    int numberOfWays(int n, int x) {
        dp.assign(n + 1, vector<int>(n + 1, -1));
        return recursive(n, x, 1);
    }
};