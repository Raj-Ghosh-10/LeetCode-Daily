class Solution:
    def maxKDivisibleComponents(self, n: int, edges: List[List[int]], values: List[int], k: int) -> int:
        g = [[] for _ in range(n)]
        for a, b in edges:
            g[a].append(b)
            g[b].append(a)

        self.ans = 0

        def dfs(u, p):
            s = values[u]
            for v in g[u]:
                if v == p:
                    continue
                s += dfs(v, u)
            if s % k == 0:
                self.ans += 1
                return 0
            return s

        dfs(0, -1)
        return self.ans




class Solution(object):
    def maxKDivisibleComponents(self, n, edges, values, k):
        g = [[] for _ in range(n)]
        for a, b in edges:
            g[a].append(b)
            g[b].append(a)

        self.ans = 0

        def dfs(u, p):
            s = values[u]
            for v in g[u]:
                if v == p:
                    continue
                s += dfs(v, u)
            if s % k == 0:
                self.ans += 1
                return 0
            return s

        dfs(0, -1)
        return self.ans