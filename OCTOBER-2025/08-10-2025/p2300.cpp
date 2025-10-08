class Solution {
public:
    vector<int> successfulPairs(vector<int>&x, vector<int>&v, long long k) {
        vector<int>ans;
        int n=x.size();
        int m=v.size();
        sort(v.begin(),v.end());
        for(int i=0;i<n;i++){

            int l=0,h=m-1;
            int idx=m;
            while(l<=h){
                int mid=l+(h-l)/2;
               long long  int gg=1LL*v[mid]*x[i];
                if(gg>=k){
                    idx=mid;
                    h=mid-1;
                }
                else{
                    l=mid+1;
                }

            }
           
                ans.push_back(m-idx);
           
        }
        return ans;
    }
};