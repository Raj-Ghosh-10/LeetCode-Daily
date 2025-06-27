class Solution {
public:
bool find(string s,string p,int k){
    int i=0;
    int j=0;
    while(i<s.size() && k){
        if(s[i]==p[j]){
            i++;
            j++;
        }
        else
        i++;
        if(j==p.size()){
            j=0;
        k--;
        }

    }
    return k<=0;
}
    string longestSubsequenceRepeatedK(string s, int k) {
        queue<string>q;
        q.push("");
        string ans;
        while(!q.empty()){
            auto str=q.front();
            q.pop();
            string p=str;
            for(char ch='a';ch<='z';ch++){
                if(find(s,str+ch,k)){
                    p=str+ch;
                    if(p.size()>ans.size() || p>ans)
                    ans=p;
                    q.push(p);
                }
                
            }
        }
        return ans;

    }
};