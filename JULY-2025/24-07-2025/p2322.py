class Solution:
    def minimumScore(self, nums: List[int], edges: List[List[int]]) -> int:
        conns = defaultdict(list)
        for u, v in edges:
            conns[u].append(v)
            conns[v].append(u)
        totalXor = reduce(lambda x, y: x ^ y, nums)
        subXor, children, visited = nums.copy(), {}, set()
        edges = []
        def dfs(parent: int) -> tuple[int, set[str]]:
            xor = nums[parent]
            children[parent] = set()
            for c in conns[parent]:
                e1, e2 = (parent, c), (c, parent)
                if e1 not in visited and e2 not in visited:
                    visited.add(e1)
                    visited.add(e2)
                    edges.append(e1)
                    children[parent].add(c)
                    x, subs = dfs(c)
                    xor ^= x
                    children[parent] |= subs
            subXor[parent] = xor
            return xor, children[parent]
        dfs(0)
        res = float('inf')
        for idx, e1 in enumerate(edges):
            xorRight = subXor[e1[1]]
            xorLeft = totalXor ^ xorRight
            for e2 in edges[idx + 1:]:
                x1 = subXor[e2[1]]
                if e2[1] in children[e1[1]]:
                    x2 = xorRight ^ x1
                    x3 = xorLeft
                else:
                    x2 = xorLeft ^ x1
                    x3 = xorRight
                res = min(
                    res, max(x1, x2, x3) - min(x1, x2, x3)
                )
        return res