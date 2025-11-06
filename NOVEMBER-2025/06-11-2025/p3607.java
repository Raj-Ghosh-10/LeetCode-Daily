class Solution {

    public void dfs(List<List<Integer>> arr, int [] memo, int c,  int u) {
        memo[u] = c;

        for (int v : arr.get(u)) {
            if (memo[v] == c) continue;
            dfs(arr, memo, c, v);
        }
    }
 
    public int[] processQueries(int n, int[][] edges, int[][] queries) {

        int m = edges.length;

        List<List<Integer>> arr = new ArrayList<>();
        for (int i = 0; i <= n; i++) arr.add(new ArrayList<>());

        for (int [] e: edges) {
            arr.get(e[0]).add(e[1]);
            arr.get(e[1]).add(e[0]);
        }  

        int [] memo = new int[n + 1];
        int cur = 0;

        for (int i = 1; i <= n; i++) {
            if (memo[i] != 0) continue;
            cur++;
            dfs(arr, memo, cur, i);
        }

        List<List<Integer>> g = new ArrayList<>();
        for (int i = 0; i <= cur; i++) g.add(new ArrayList<>());

        for (int i = 1; i <= n; i++) {
            g.get(memo[i]).add(i);
        }

        int [] pts = new int[cur + 1];
        boolean [] off = new boolean[n + 1];

        List<Integer> ans1 = new ArrayList<>();

        for (int i = 0; i < queries.length; i++) {
            if (queries[i][0] == 2) {
                off[queries[i][1]] = true;
                continue;
            } 
                
            if (!off[queries[i][1]]) {
                ans1.add(queries[i][1]);
                continue;
            } 
            
            int gr = memo[queries[i][1]];
            List<Integer> group = g.get(gr);

            int pt = pts[gr];
            while (pt < group.size() && off[group.get(pt)]) pt++;

            if (pt >= group.size()) {
                ans1.add(-1);
            } else {
                ans1.add(group.get(pt));
            }
            
            pts[gr] = pt;
        }

        int [] ans = new int[ans1.size()];
        for (int i = 0; i < ans1.size(); i++) ans[i] = ans1.get(i);

        return ans;
    }
}