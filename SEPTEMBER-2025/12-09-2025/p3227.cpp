class Solution {
public:
    bool doesAliceWin(string s) {
        bool isvowel=0;
        for(int i=0;i<s.length();i++){
            if(s[i]=='a'||s[i]=='e'||s[i]=='i'||s[i]=='o'||s[i]=='u'){
                isvowel=1;
            }
        }
        if(isvowel) return true;
        return false;
    }
};