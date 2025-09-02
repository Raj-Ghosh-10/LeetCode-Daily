#define vi vector<int>
#define vvi vector<vi>
class Solution {
public:
    int numberOfPairs(vector<vector<int>>& points) {
        int n = points.size();
        // Sort points: primarily by x (ascending), and for same x, by y (descending)
        // This ensures we process points from left to right, and for same x from top to bottom
        sort(points.begin(), points.end(), [&](auto& x, auto& y) -> bool {
            return x[0] == y[0] ? x[1] > y[1] : x[0] < y[0];
        });

        int ans = 0;
        // Iterate over each point as candidate A (upper left)
        for (int i = 0; i < n; ++i) {
            int a = points[i][1];  // y-coordinate of point A
            int last = -1;  // Tracks the highest y-coordinate encountered so far in this iteration (initialized to -1 as lowest)
            
            // For each point j to the right of i, check if it can be candidate B (lower right)
            for (int j = i + 1; j < n; ++j) {
                int b = points[j][1];  // y-coordinate of point B
                // Check if A is above B (a >= b) AND 
                // if current point B's y is greater than 'last' (meaning no point between them has a y between b and a)
                if (a >= b and last < b) {
                    last = b;  // Update last to current y
                    ++ans;     // Valid pair found
                }
            }
        }

        return ans;
    }
};