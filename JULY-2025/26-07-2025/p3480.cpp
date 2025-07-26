class Solution {
public:
    long long maxSubarrays(int n, vector<vector<int>>& conflictingPairs) {
        long long valid = 0;
        vector<vector<int>> conflictingPoints(n + 1);
        for (auto& p : conflictingPairs) {
            int a = min(p[0], p[1]), b = max(p[0], p[1]);
            conflictingPoints[b].push_back(a); 
        }
        int maxConflictPoint = 0;
        int secondMaxConflictPoint = 0;
        vector<long long> extra(n + 1, 0);
        for (int end = 1; end <= n; end++) {
            for (auto& u : conflictingPoints[end]) {
                if (u >= maxConflictPoint) {
                    secondMaxConflictPoint = maxConflictPoint;
                    maxConflictPoint = u;
                } else if (u > secondMaxConflictPoint)
                    secondMaxConflictPoint = u;
            }
            valid += end - maxConflictPoint;
            extra[maxConflictPoint] +=
                maxConflictPoint - secondMaxConflictPoint;
        }
        return valid + *max_element(extra.begin(), extra.end());
    }
};