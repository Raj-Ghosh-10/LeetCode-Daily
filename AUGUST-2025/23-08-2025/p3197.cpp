class Solution {
public:

    int minAreaToCover(int r1, int r2, int c1, int c2, vector<vector<int>>& grid) {
        int minRow = INT_MAX, minCol = INT_MAX, maxRow = INT_MIN, maxCol = INT_MIN;

        bool oneFound = false;
        for (int i = r1; i <= r2; i++) {
            for (int j = c1; j <= c2; j++) {
                if (grid[i][j] == 1) {
                    minRow = min(minRow, i);
                    maxRow = max(maxRow, i);
                    minCol = min(minCol, j);
                    maxCol = max(maxCol, j);
                    oneFound = true;
                }
            }
        }
        
        if (!oneFound) { // invalid
            return 999999; // return some large value
        }
        return (maxRow - minRow + 1) * (maxCol - minCol + 1);
    }

    int minimumSum(vector<vector<int>>& grid) {
        int R = grid.size();
        int C = grid[0].size();

        int minArea = 99999;

        vector<vector<int>> areaRowStrip(R, vector<int> (R));
        vector<vector<int>> areaColStrip(C, vector<int> (C));
        // pre-compute answers for strips as they will be computed many times for different combinations

        for (int r1 = 0; r1 < R; r1++) {
            for (int r2 = r1; r2 < R; r2++) {
                areaRowStrip[r1][r2] = minAreaToCover(r1, r2, 0, C - 1, grid);
            }
        }
        for (int c1 = 0; c1 < C; c1++) {
            for (int c2 = c1; c2 < C; c2++) {
                areaColStrip[c1][c2] = minAreaToCover(0, R - 1, c1, c2, grid);
            }
        }

        // partition type 1 : c1 , c2 (2 vertical lines to split grid in 3 parts)

        for (int c1 = 0; c1 < C - 2; c1++) {
            for (int c2 = c1 + 1; c2 < C - 1; c2++) {
                int a1 = areaColStrip[0][c1];
                int a2 = areaColStrip[c1 + 1][c2];
                int a3 = areaColStrip[c2 + 1][C - 1];

                minArea = min(minArea, a1 + a2 + a3);
            }
        }

        // partition type 2 : r1, r2 (2 horizontal lines to split grid in 3 parts)
        for (int r1 = 0; r1 < R - 2; r1++) {
            for (int r2 = r1 + 1; r2 < R - 1; r2++) {
                int a1 = areaRowStrip[0][r1];
                int a2 = areaRowStrip[r1 + 1][r2];
                int a3 = areaRowStrip[r2 + 1][R - 1];

                minArea = min(minArea, a1 + a2 + a3);
            }
        }

        // partition type 3: r, c (one horizontal and one vertical line to split in 4 quadrants)
        // combine any 2 adjacent quadrants to make 3 parts
        

        for (int r = 0; r < R - 1; r++) {
            for (int c = 0; c < C - 1; c++) {
                // 4 cases of merging adjacent quadrants
                int a1 = areaRowStrip[0][r]; // merge I and II
                int a2 = minAreaToCover(r + 1, R - 1, 0, c, grid);
                int a3 = minAreaToCover(r + 1, R - 1, c + 1, C - 1, grid);
                minArea = min(minArea, a1 + a2 + a3);

                int a1_ = minAreaToCover(0, r, 0, c, grid); // merge II and III
                int a2_ = minAreaToCover(r + 1, R - 1, 0, c, grid);
                int a3_ = areaColStrip[c + 1][C - 1];
                minArea = min(minArea, a1_ + a2_ + a3_);

                int a1__ = minAreaToCover(0, r, 0, c, grid); // merge III and IV
                int a2__ = minAreaToCover(0, r, c + 1, C - 1, grid);
                int a3__ = areaRowStrip[r + 1][R - 1];
                minArea = min(minArea, a1__ + a2__ + a3__);

                int a1___ = areaColStrip[0][c]; // merge IV and I
                int a2___ = minAreaToCover(0, r, c + 1, C - 1, grid);
                int a3___ = minAreaToCover(r + 1, R - 1, c + 1, C - 1, grid);
                minArea = min(minArea, a1___ + a2___ + a3___);

            }
        }

        return minArea;
    }
};