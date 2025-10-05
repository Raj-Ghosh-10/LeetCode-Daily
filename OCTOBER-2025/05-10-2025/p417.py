from collections import deque
from typing import List

class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        if not heights or not heights[0]:
            return []

        m, n = len(heights), len(heights[0])

        def bfs(starts):
            reach = set()
            q = deque(starts)
            dirs = [(0,1),(0,-1),(1,0),(-1,0)]
            while q:
                i, j = q.popleft()
                if (i,j) in reach:
                    continue
                reach.add((i,j))
                for di,dj in dirs:
                    ni, nj = i+di, j+dj
                    if 0 <= ni < m and 0 <= nj < n and heights[ni][nj] >= heights[i][j]:
                        q.append((ni,nj))
            return reach

        pacific_starts = [(i,0) for i in range(m)] + [(0,j) for j in range(n)]
        atlantic_starts = [(i,n-1) for i in range(m)] + [(m-1,j) for j in range(n)]

        pacific_reach = bfs(pacific_starts)
        atlantic_reach = bfs(atlantic_starts)

        return [[i,j] for i,j in pacific_reach & atlantic_reach]