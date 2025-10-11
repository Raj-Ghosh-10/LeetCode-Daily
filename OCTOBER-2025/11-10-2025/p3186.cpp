class Solution {
public:
    long long maximumTotalDamage(vector<int>& power) {
        unordered_map<int, int> mp;
        for(auto a: power) {
            mp[a]++;
        }

        vector<pair<long long, long long>> v;
        for(auto [k, val]: mp) v.push_back({k, val});
        sort(v.begin(), v.end());

        int n = v.size();
        if(n == 1) return v[0].first * v[0].second;

        vector<long long> dp(n, 0);
        dp[0] = v[0].first * v[0].second;
        if(v[1].first - v[0].first <= 2) {
            dp[1] = v[1].first * v[1].second;
        } else {
            dp[1] = dp[0] + v[1].first * v[1].second;
        }
        dp[1] = max(dp[1], dp[0]);
        
        long long maxv = dp[1];
        for(int i=2; i<n; ++i) {
            int cur = v[i].first;
            long long part = cur * v[i].second;

            if(v[i-1].first < cur - 2) {
                dp[i] = dp[i-1] + part;
            } else if(v[i-1].first == cur - 2) {
                dp[i] = dp[i-2] + part;
                
            } else if(v[i-1].first == cur - 1) {
                if(v[i-2].first != cur - 2) {
                    dp[i] = dp[i-2] + part;
                } else {
                    if(i >= 3) {
                        dp[i] = dp[i-3] + part;
                    } else {
                        dp[i] = part;
                    }
                }
            }
            dp[i] = max(maxv, dp[i]);
            maxv = max(maxv, dp[i]);

        }

        return dp[n-1];
    }
};