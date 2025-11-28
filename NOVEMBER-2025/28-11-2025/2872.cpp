class Solution {
public:
    int ans = 0;
    vector<vector<int>> g;

    long long dfs(int u, int parent, vector<int>& values, int k) {
        long long sum = values[u];

        for (int v : g[u]) {
            if (v == parent) continue;
            sum += dfs(v, u, values, k);
        }

        if (sum % k == 0) {
            ans++;
            return 0;
        }

        return sum;
    }

    int maxKDivisibleComponents(int n, vector<vector<int>>& edges, vector<int>& values, int k) {
        g.assign(n, {});

        for (auto &e : edges) {
            g[e[0]].push_back(e[1]);
            g[e[1]].push_back(e[0]);
        }

        dfs(0, -1, values, k);
        return ans;
    }
};