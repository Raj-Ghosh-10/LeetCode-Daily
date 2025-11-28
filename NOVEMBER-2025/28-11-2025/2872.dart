class Solution {
  int maxKDivisibleComponents(int n, List<List<int>> edges, List<int> values, int k) {
    List<List<int>> g = List.generate(n, (_) => []);
    for (var e in edges) {
      g[e[0]].add(e[1]);
      g[e[1]].add(e[0]);
    }

    int ans = 0;
    List<int> parent = List.filled(n, -1);
    List<int> state = List.filled(n, 0); // 0: not visited, 1: children processed
    List<int> stack = [0];
    List<int> sum = List.from(values);

    while (stack.isNotEmpty) {
      int u = stack.last;
      if (state[u] == 0) {
        state[u] = 1;
        for (var v in g[u]) {
          if (v != parent[u]) {
            parent[v] = u;
            stack.add(v);
          }
        }
      } else {
        stack.removeLast();
        if (parent[u] != -1) sum[parent[u]] += sum[u];
        if (sum[u] % k == 0) {
          ans++;
          if (parent[u] != -1) sum[parent[u]] -= sum[u];
        }
      }
    }

    return ans;
  }
}