class Solution {
public:
    int maxTotalFruits(vector<vector<int>>& fr, int st, int k) {
        int n=fr.size(),x,total=0;
        if(st<fr[0][0]) x = -1;
        else if(st>fr[n-1][0]) x = n-1;
        else{
            double s,e;
            for(int i=0;i<n;i++){
                if(st>fr[i][0]) s = i;
                if(st<fr[i][0]){
                    e = i;break;
                }
            }x = (s+e)/2;
        }
        fr.insert(fr.begin()+x+1,{st,0});x = x+1;
        for(int i=x;i<=n;i++) total = total + fr[i][1];
        int i=x,j=n,mx=0;
        while(true){
            while(j>x && 2*(st-fr[i][0]) + fr[j][0]-st >k){
                j--;total  = total - fr[j+1][1];
            }
            if(2*(st-fr[i][0]) + fr[j][0]-st <=k) mx = max(mx,total);
            i--;if(i<0) break;total = total + fr[i][1];
        }
        i=x;j=0,total=0;
        for(int p=x;p>=0;p--) total = total + fr[p][1];
        while(true){
            while(j<x && st-fr[j][0] + 2*(fr[i][0]-st) >k){
                j++;total  = total - fr[j-1][1];
            }
            if(st-fr[j][0] + 2*(fr[i][0]-st) <=k) mx = max(mx,total);
            i++;if(i>n) break;total = total + fr[i][1];
        }
        return mx;
    }
};