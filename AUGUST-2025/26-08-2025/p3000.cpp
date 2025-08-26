class Solution {
public:
    int areaOfMaxDiagonal(vector<vector<int>>& dimensions) {
        int n = dimensions.size();
        long long maxarea = INT_MIN;
        int maxdiag = INT_MIN;

        for (int i = 0; i < n; i++) {
            long long l = dimensions[i][0];
            long long b = dimensions[i][1];
            int area = (l * b);
            long long diag = (l * l) + (b * b);

            if (diag > maxdiag) {
                maxdiag = diag;
                maxarea = area;
            }
            else if (diag == maxdiag) {
                if (area > maxarea)
                    maxarea = area;
            }
        }
        return maxarea;
    }
};