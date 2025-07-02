class Solution {
public:
    int possibleStringCount(string word, int k) {
        vector<int> arr;
        int cnt = 1, MOD = 1e9 + 7;
        char prev = word[0];
        for(int i=1; i<word.size(); ++i){
            if(word[i] != prev){
                arr.push_back(cnt);
                cnt = 0;
                prev = word[i];
            }
            cnt++;
        }
        if(cnt > 0) arr.push_back(cnt);
        int sz = arr.size();
        long long total = arr[0];
        for(int i=1; i<sz; ++i) total = (total * arr[i]) % MOD; 
        if(k < arr.size()) return total;
        long long dp[k], cpy[k];
        memset(dp, 0, sizeof(dp));
        dp[0] = 1;
        for(int i=1; i <= sz; ++i){
            for(int j=0; j<k; ++j) cpy[j] = dp[j];
            memset(dp, 0, sizeof(dp));
            long long prefix[k];
            memset(prefix, 0, sizeof(prefix));
            for(int j=0; j<k; ++j){
                prefix[j] = cpy[j];
                if(j > 0) prefix[j] = (prefix[j] + prefix[j-1]) % MOD;
            }
            for(int j=i; j<k; ++j){
                dp[j] = prefix[j-1];
                int prev_id = min(arr[i-1], j);
                if(j - prev_id > 0) dp[j] = (dp[j] - prefix[j - prev_id - 1] + MOD) % MOD;
            }
        }       
        for(int i=1; i<k; ++i) dp[i] = (dp[i] + dp[i-1]) % MOD;
        return (total - dp[k-1] + MOD) % MOD;
    }
};