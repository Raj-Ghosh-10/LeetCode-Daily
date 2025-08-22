class Solution {
public:
    int minimumArea(vector<vector<int>>& grid) {
        int n = grid.size();
        int m = grid[0].size();
        vector<int>rows(n,0); 
        vector<int>cols(m,0) ; 
        for(int i = 0 ; i<n ; i++){
            for(int j= 0 ; j<m ;j++){
                if(grid[i][j]==1){
                    rows[i]=1 ; 
                    cols[j]=1 ;
                }
            }
        }

        int l = 0 ; 
        int b = 0 ; 

        int x = 0 , y = n-1; 
        while(rows[x]!=1){
            x++;
        }
        while(rows[y]!=1){
            y--;
        }
        l = y- x +1 ;
        int a = 0 , z = m-1 ;
        while(cols[a]!=1){
            a++; 
        }
        while(cols[z]!=1){
            z--;
        }
        b = z-a+1; 
        if(l==0 || b==0){
            return max(l,b);
        }
        return l*b ; 
    }
};