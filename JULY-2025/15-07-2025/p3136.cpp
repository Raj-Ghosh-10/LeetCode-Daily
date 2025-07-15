class Solution {
public:
    bool isValid(string word) {
        int n=word.size();
        if(n<3)return false;
        int vow=0,cons=0,digit=1;
        string vowel="aeiouAEIOU";
        for(char c:word){
             if(!isalnum(c))return false; // neither letter nor digit
             else if(vowel.find(c)!=string::npos)vow=1; //vowel
             else if(!isdigit(c)) cons=1; // consonant
        }
        return (vow==1 && cons==1);
        
    }
};