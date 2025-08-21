class Solution {
public:
    int numSubmat(vector<vector<int>>& mat) {
        int rows = mat.size();
        int cols = mat[0].size();
        int sum = 0;

        for (int i = 0; i < rows; i++){
            for (int j = 1; j < cols; j++){
                if (mat[i][j] == 0) continue;
                else mat[i][j] += mat[i][j-1];
            }
        }

        for (int r = 0; r < rows; r++){
            for (int c = 0; c < cols; c++){
                if (mat[r][c] == 0) continue;
                int width = INT_MAX;
                for (int dr = r; dr < rows; dr++){
                    width = min(width, mat[dr][c]);
                    if (width == 0) break;
                    sum += width;
                }
            }
        }

        return sum;
    }
};