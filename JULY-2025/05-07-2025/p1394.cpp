class Solution {
public:
    int findLucky(vector<int>& arr) {
        int n = arr.size();
        map<int, int> f;
        for(int i = 0; i < n; i++) {
           f[arr[i]]++;

        }
        int ans = -1;
        for(auto& x : f) {
            if(x.first == x.second) {
                ans = max(ans, x.first);
            }
        }
        return ans;
    }
};