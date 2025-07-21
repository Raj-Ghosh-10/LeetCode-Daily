class Solution {
public:
    string makeFancyString(string s) {
        int n = s.size();
        string ans = "";
        int count = 0;
        for(int i=0;i<n;i++){
            if(count==0){
                ans+=s[i];
                count++;
            }
            else if(s[i]==s[i-1]){
                if(count<2){
                    ans+=s[i];
                    count++;
                }
                else{
                    continue;
                }
            }
            else{
                ans+=s[i];
                count=1;
            }
        }
        return ans;
    }
};