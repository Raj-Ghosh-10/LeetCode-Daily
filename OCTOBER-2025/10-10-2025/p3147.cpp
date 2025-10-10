class Solution {
public:
    int maximumEnergy(vector<int>& energy, int k) {
        int ans=-1e9;
        unordered_map<int,int> mp;
        for(int i=energy.size()-1;i>=0;i--){
            int idx=(i%k);
            mp[idx]+=energy[i];
            ans=max(ans,mp[idx]);
        }
        return ans;
    }
};