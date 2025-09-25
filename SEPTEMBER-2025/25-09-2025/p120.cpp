class Solution {
    int memoization(int i,int j,vector<vector<int>>& tri,vector<vector<int>>& dp){
        int n=tri.size();
        if(i==n-1) return tri[i][j];
        if(dp[i][j]!=-1) return dp[i][j];
        int r=memoization(i+1,j+1,tri,dp);
        int b=memoization(i+1,j,tri,dp);
        return dp[i][j]=min(r,b)+tri[i][j];
    }
public:
    int minimumTotal(vector<vector<int>>& triangle) {
        int n=triangle.size();
        vector<vector<int>>dp(n,vector<int>(n,-1));
        return memoization(0,0,triangle,dp);
    }
};