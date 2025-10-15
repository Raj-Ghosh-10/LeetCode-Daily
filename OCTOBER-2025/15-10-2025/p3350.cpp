class Solution {
public:
    int maxIncreasingSubarrays(vector<int>& nums) {
        int n = nums.size();
        vector<int> v(n, 1);

        for(int i=0; i<n; ++i) {
            if(i > 0 && nums[i] > nums[i-1]) {
                v[i] = v[i-1] + 1;
            }
        }

        int ans = 1;
        for(int i=n-1; i>=0; --i) {
            int len = v[i];
            if(i >= len) {
                int a1 = min(len, v[i-len]);
                ans = max(ans, a1);
            }
            ans = max(ans, len / 2);
        }

        return ans;
    }
};