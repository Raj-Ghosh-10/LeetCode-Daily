class Solution {
public:
    vector<int>powersOf2(int n){
        vector<int>v;

        int curr = 1;
        while(n > 0){
            if(n % 2 == 1){
                v.push_back(curr);
            }
            curr *= 2;
            n /= 2;
        }
        return v;
    }

    vector<int> productQueries(int n, vector<vector<int>>& queries) {
        const int MOD = 1e9 + 7;
        vector<int>res;
        vector<int>powers = powersOf2(n);
        
        for(auto it : queries){
            long long prod = 1;
            for(int i = it[0]; i <= it[1]; i++){
                prod = (prod * powers[i]) % MOD;
            }
            res.push_back(prod);
        }
        
        return res;
    }
};