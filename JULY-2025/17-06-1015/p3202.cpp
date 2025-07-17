class Solution {
public:
    int maximumLength(vector<int>& nums, int k) {
        int n = nums.size();
        vector<vector<int>>dp(n,vector<int>(k+1,0));
        int res = 2;
        for(int i=1;i<n;i++){
            for(int j=0;j<i;j++){
                int sum = (nums[i] + nums[j])%k;
                dp[i][sum] = 2;
                dp[i][sum] = max(dp[i][sum],dp[j][sum]+1);
                res = max(res,dp[i][sum]);
            }
        }
        return res;
    }
};