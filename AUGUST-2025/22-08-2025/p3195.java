class Solution {
    public int minimumArea(int[][] grid) {
        int gridMinLine = -1, gridMaxLine = 0, gridMinColumn = -1, gridMaxColumn = 0;
        for (int line = 0; line < grid.length; line++) {
            for (int column = 0; column < grid[line].length; column++) {
                if (grid[line][column] == 1) {
                    if (gridMinLine == -1) {
                        gridMinLine = line;
                    }
                    if (gridMinColumn == -1) {
                        gridMinColumn = column;
                    } else {
                        gridMinColumn = Math.min(gridMinColumn, column);
                    }
                    gridMaxLine = Math.max(gridMaxLine, line);
                    gridMaxColumn = Math.max(gridMaxColumn, column);
                }
            }
        }
        return (1 + gridMaxColumn - gridMinColumn) * (1 + gridMaxLine - gridMinLine);
        
    }
}