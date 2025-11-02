from typing import List

class Solution:
    def countUnguarded(self, m: int, n: int, guards: List[List[int]], walls: List[List[int]]) -> int:
        arr = [[0]*n for _ in range(m)]
        for r, c in guards:
            arr[r][c] = 'G'
        for r, c in walls:
            arr[r][c] = 'W'

        
        directions = [(0,1), (1,0), (0,-1), (-1,0)]

   
        for r, c in guards:
            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                while 0 <= nr < m and 0 <= nc < n and arr[nr][nc] not in ('G', 'W'):
                    if arr[nr][nc] == 0:
                        arr[nr][nc] = 'V'  
                    nr += dr
                    nc += dc


        ans = 0
        for i in range(m):
            for j in range(n):
                if arr[i][j] == 0:
                    ans += 1
        return ans