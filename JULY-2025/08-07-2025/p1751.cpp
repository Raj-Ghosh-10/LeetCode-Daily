class Solution {
public:
    int maxValue(vector<vector<int>>& events, int k) {
        sort(events.begin(),events.end());
        vector<int>next(events.size(),events.size());
        for(int i=0;i<events.size();i++){
            int l=i+1;
            int r=events.size()-1;
            while(l<=r){
                int mid=(l+r)/2;
                if(events[mid][0]>=(events[i][1]+1)){
                    r=mid-1;
                }else{
                    l=mid+1;
                }
            }
            next[i]=l;
        }
        int dp[k+1][events.size()];
        for(int i=0;i<=k;i++){
            for(int j=events.size()-1;j>=0;j--){
                if(i==0){
                    dp[i][j]=0;
                }else{
                    if(next[j]>events.size()-1){
                        if(j<(events.size()-1)){
                            dp[i][j]=max(events[j][2],dp[i][j+1]);
                        }else{
                            dp[i][j]=events[j][2];
                        }
                    }else{
                        dp[i][j]=max(events[j][2]+dp[i-1][next[j]],dp[i][j+1]);
                    }
                }
            }
        }
        return dp[k][0];
    }
};