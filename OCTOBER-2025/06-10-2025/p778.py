from collections import deque

class Solution:
    def swimInWater(self, grid: List[List[int]]) -> int:
        n = len(grid)
        dirs = [(1,0),(-1,0),(0,1),(0,-1)]
        
        def canReach(t: int) -> bool:
            if grid[0][0] > t:
                return False
            visited = [[False]*n for _ in range(n)]
            dq = deque()
            dq.append((0,0))
            visited[0][0] = True
            while dq:
                r, c = dq.popleft()
                if r == n-1 and c == n-1:
                    return True
                for dr, dc in dirs:
                    nr, nc = r+dr, c+dc
                    if 0 <= nr < n and 0 <= nc < n and not visited[nr][nc] and grid[nr][nc] <= t:
                        visited[nr][nc] = True
                        dq.append((nr, nc))
            return False
        
        lo, hi = 0, n*n - 1
        ans = hi
        while lo <= hi:
            mid = (lo + hi)//2
            if canReach(mid):
                ans = mid
                hi = mid - 1
            else:
                lo = mid + 1
        return ans