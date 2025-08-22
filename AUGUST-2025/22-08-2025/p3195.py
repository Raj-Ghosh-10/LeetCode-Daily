class Solution:
    def minimumArea(self, grid: List[List[int]]) -> int:

        def dfs(g: List[List[int]]) -> int:
            rows, cols = len(g), len(g[0])

            # Base case: single cell
            if rows == 1 and cols == 1:
                return g[0][0]

            # Check if the outer rows/cols contain a '1'
            top_has_1 = any(g[0][c] == 1 for c in range(cols))
            bottom_has_1 = any(g[rows - 1][c] == 1 for c in range(cols))
            left_has_1 = any(g[r][0] == 1 for r in range(rows))
            right_has_1 = any(g[r][cols - 1] == 1 for r in range(rows))

            # If all four borders have 1s, we've found the minimal rectangle
            if top_has_1 and bottom_has_1 and left_has_1 and right_has_1:
                return rows * cols

            # Otherwise, trim away borders without 1s and recurse
            new_grid = []
            for r in range(rows):
                # Skip empty top or bottom row
                if (not top_has_1 and r == 0) or (not bottom_has_1 and r == rows - 1):
                    continue

                # Trim left and right columns if empty
                row_copy = g[r][:]
                if not left_has_1:
                    row_copy = row_copy[1:]
                if not right_has_1:
                    row_copy = row_copy[:-1]

                new_grid.append(row_copy)

            return dfs(new_grid)

        return dfs(grid)