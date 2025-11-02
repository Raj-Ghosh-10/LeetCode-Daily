class Solution {
public:
    int countUnguarded(int m, int n, vector<vector<int>>& guards, vector<vector<int>>& walls) {
        vector<vector<int>> cells(m, vector<int>(n,0));
        for(int i = 0; i < guards.size(); i++){
            int temp1 = guards[i][0];
            int temp2 = guards[i][1];
            cells[temp1][temp2] = 1;
        }
        for(int i = 0; i < walls.size(); i++){
            int temp1 = walls[i][0];
            int temp2 = walls[i][1];
            cells[temp1][temp2] = 2;
        }
        for(int i = 0; i < cells.size(); i++){
            for(int j = 0; j < cells[i].size(); j++){
                if(cells[i][j] == 1){
                    for(int k = j-1; k >= 0; k--){
                        if(cells[i][k] == 2 || cells[i][k] == 1){
                            break;
                        }
                        cells[i][k] = -1;
                    }
                    for(int k = j+1; k < cells[i].size(); k++){
                        if(cells[i][k] == 2 || cells[i][k] == 1){
                            break;
                        }
                        cells[i][k] = -1;
                    }
                    for(int k = i-1; k >= 0; k--){
                        if(cells[k][j] == 2 || cells[k][j] == 1){
                            break;
                        }
                        cells[k][j] = -1;
                    }
                    for(int k = i+1; k < cells.size(); k++){
                        if(cells[k][j] == 2 || cells[k][j] == 1){
                            break;
                        }
                        cells[k][j] = -1;
                    }

                }
            }
        }
        int count = 0;
        for(int i = 0; i < cells.size(); i++){
            for(int j = 0; j < cells[i].size(); j++){
                if(cells[i][j] == 0){
                    count++;
                }
            }
        }
        return count;
    }
};