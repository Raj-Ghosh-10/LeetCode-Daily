class Solution:
    def numSubmat(self, mat: List[List[int]]) -> int:
        m, n = len(mat), len(mat[0])
        res = 0
        col_h = [[0]*n for _ in range(m)]

        # Step 1: calculate vertical heights
        for i in range(m):
            for j in range(n):
                if mat[i][j] == 1:
                    col_h[i][j] = 1 if i == 0 else col_h[i-1][j] + 1

        # Step 2: count rectangles row by row
        for i in range(m):
            for j in range(n):
                min_h = col_h[i][j]
                for k in range(j, -1, -1):
                    if min_h == 0: break
                    min_h = min(min_h, col_h[i][k])
                    res += min_h
        return res