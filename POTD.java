class Solution {
    int ans = 0;
    List<List<Integer>> g;

    long dfs(int u, int p, int[] values, int k) {
        long sum = values[u];
        for (int v : g.get(u)) {
            if (v == p) continue;
            sum += dfs(v, u, values, k);
        }
        if (sum % k == 0) {
            ans++;
            return 0;
        }
        return sum;
    }

    public int maxKDivisibleComponents(int n, int[][] edges, int[] values, int k) {
        g = new ArrayList<>();
        for (int i = 0; i < n; i++) g.add(new ArrayList<>());
        for (int[] e : edges) {
            g.get(e[0]).add(e[1]);
            g.get(e[1]).add(e[0]);
        }
        dfs(0, -1, values, k);
        return ans;
    }
}