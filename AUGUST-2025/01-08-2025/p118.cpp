class Solution {
public:
    vector<vector<int>> generate(int n) {
        vector<vector<int>> result;
        result.push_back({1});
        if(n==1) return result;

        result.push_back({1,1});

        for(int i=3; i<=n; i++){
            vector<int> temp;
            temp.push_back(1);
            int y=1;
            while(y<i-1){
                temp.push_back(result.back()[y-1]+result.back()[y]);
                y++;
            }
            temp.push_back(1);
            result.push_back(temp);
            
        }

        return result;
    }
};