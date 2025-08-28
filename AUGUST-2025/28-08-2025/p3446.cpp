class Solution {
public:
    vector<vector<int>> sortMatrix(vector<vector<int>>& grid) {
        int n=grid.size();
        int m=grid[0].size();

        map<int,vector<int>>umap;

        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                umap[i-j].push_back(grid[i][j]);
            }
        }

        for(auto &x: umap){
            if(x.first < 0){
                sort(x.second.rbegin(), x.second.rend());
            }
            else{
                sort(x.second.begin() , x.second.end());
            }
        }

        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                grid[i][j]=umap[i-j].back();
                umap[i-j].pop_back();
            }
        }

        return grid;
    }
};