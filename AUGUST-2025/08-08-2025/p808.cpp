class Solution {
public:
    double soupServings(int n) {
        if (n >= 4800) return 1.0; // optimization for large n
        int N = (n + 24) / 25;     // normalize to units of 25 mL
        memo.assign(N + 1, vector<double>(N + 1, -1.0));
        return dfs(N, N);
    }

private:
    vector<vector<double>> memo;

    double dfs(int a, int b) {
        if (a <= 0 && b <= 0) return 0.5;
        if (a <= 0) return 1.0;
        if (b <= 0) return 0.0;

        if (memo[a][b] != -1.0) return memo[a][b];

        double res = 0.25 * (
            dfs(a - 4, b)     + // 100 A, 0 B
            dfs(a - 3, b - 1) + // 75 A, 25 B
            dfs(a - 2, b - 2) + // 50 A, 50 B
            dfs(a - 1, b - 3)   // 25 A, 75 B
        );

        return memo[a][b] = res;
    }
};