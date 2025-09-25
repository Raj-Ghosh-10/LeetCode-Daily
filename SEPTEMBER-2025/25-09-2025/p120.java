class Solution {
    public int minimumTotal(List<List<Integer>> triangle) {
        int len = triangle.size();
        int wid = triangle.get(len-1).size();
        int dp[][] = new int[len+1][wid+1];

        for(int i=0;i<=len;i++){
            for(int j=0;j<=wid;j++){
                dp[i][j]=-100000;
            }
        }
        return findMin(triangle,0,0,dp);
    }

    public int findMin(List<List<Integer>> triangle,int row, int col,
    int[][] dp){
        int len = triangle.size();
        if(row == len){
            return 0;
        }
        int wid = triangle.get(row).size();
        if(col == wid){
            return 0;
        }

        if(dp[row][col] != -100000){
            return dp[row][col];
        }
        dp[row][col] =  triangle.get(row).get(col) + Math.min(
            findMin(triangle,row+1,col,dp),findMin(triangle,row+1,col+1,dp)
        );

        return dp[row][col];
    }
}