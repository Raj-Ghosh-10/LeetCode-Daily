class Solution {
public:
    long long minCost(vector<int>& basket1, vector<int>& basket2) {
        unordered_map<int, int> fr1;
        unordered_map<int, int> fr2;
        unordered_map<int, int> totFr;
        vector<int> swaps;
        int minEl = INT_MAX;
        int n = basket1.size();
        
        for (int i = 0; i < n; i++) {
            fr1[basket1[i]]++;
            fr2[basket2[i]]++;
            totFr[basket1[i]]++;
            totFr[basket2[i]]++;
            minEl = min(minEl, min(basket1[i], basket2[i]));
        }

        long long minElSwaps = 0;
        for (auto& it : totFr) {
            int key = it.first;
            int val = it.second;
            if (val % 2)
                return -1;
            int swapReq = abs(fr1[key] - fr2[key]) / 2;
            if (key == minEl)
                minElSwaps = swapReq;
            for (int i = 0; i < swapReq; i++) {
                swaps.push_back(key);
            }
        }

        sort(swaps.begin(), swaps.end());

        long long ans = 0;
        for (int i = 0; i < swaps.size() / 2; i++) {
            ans += min((long long)swaps[i], 2LL * minEl);
        }

        return ans;
    }
};