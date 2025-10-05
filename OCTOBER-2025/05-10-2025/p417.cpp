class Solution {
public:

    bool valid(int i , int j , int m , int n)
    {if (i < 0 || i >= m || j<0 || j>=n ) return false;
        return true;
    }
    void dfs(int i , int j , int m , int n , vector<vector<bool>>& vis, vector<vector<int>>& heights)
    {
        vis[i][j] = true;
        
        if(valid(i+1, j , m , n) && !vis[i+1][j] && heights[i][j]<= heights[i+1][j])
            dfs(i+1, j, m , n , vis, heights);
        if(valid(i-1, j , m , n) && !vis[i-1][j] && heights[i][j]<= heights[i-1][j])
            dfs(i-1, j, m , n , vis, heights);
        if(valid(i, j-1 , m , n) && !vis[i][j-1] && heights[i][j]<= heights[i][j-1])
            dfs(i, j-1, m , n , vis, heights);
        if(valid(i, j+1 , m , n) && !vis[i][j+1] && heights[i][j]<= heights[i][j+1])
            dfs(i, j+1, m , n , vis, heights);
    }
    vector<vector<int>> pacificAtlantic(vector<vector<int>>& heights) {
        
        vector<vector<int>> ans;
        int m= heights.size();
        int n = heights[0].size();

        vector<vector<bool>> pac(m, vector<bool>(n));
        vector<vector<bool>> alt(m, vector<bool>(n));

        for (int i = 0; i < n; i++) {
            dfs(0, i, m , n , pac, heights); // first col
            dfs(m-1, i, m , n , alt, heights); // last col
        }

        for (int i = 0; i < m; i++) {
            dfs(i , 0, m , n , pac, heights); // first col
            dfs(i, n-1 ,m, n , alt, heights); // last col
        }

         for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (pac[i][j] && alt[i][j])
                    ans.push_back({i, j});
            }
        }
        return ans;
    }
};