class Solution:
    def sortMatrix(self, grid: List[List[int]]) -> List[List[int]]:
        n = len(grid)
        d = {}

        for i in range(n):
            for j in range(n):
                k = i - j
                if k not in d:
                    d[k] = []
                d[k].append(grid[i][j])

        for k in d:
            d[k].sort(reverse=(k >= 0))

        for i in range(n):
            for j in range(n):
                grid[i][j] = d[i - j].pop(0)

        return grid