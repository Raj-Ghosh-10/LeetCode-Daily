class Solution:
    def trapRainWater(self, heightMap: List[List[int]]) -> int:
        rows, cols = len(heightMap), len(heightMap[0])
        minheap = []
        for r in range(rows):
            for c in range(cols):
                if r in [0, rows-1] or c in [0, cols-1]: #border cells
                    heappush(minheap, (heightMap[r][c], r, c))
                    heightMap[r][c] = -1
        res = 0
        max_h = -1
        while minheap:
            h, r, c = heappop(minheap)
            max_h = max(max_h, h)
            res += max_h - h
            dirs = [[r+1, c], [r-1, c], [r, c+1], [r, c-1]]
            for dr, dc in dirs:
                if (dr < 0 or dr >= rows or dc < 0 or dc >= cols or heightMap[dr][dc] == -1):
                    continue
                heappush(minheap, (heightMap[dr][dc], dr, dc))
                heightMap[dr][dc] = -1

        return res
                
        