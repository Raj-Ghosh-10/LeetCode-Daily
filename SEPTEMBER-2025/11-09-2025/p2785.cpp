class Solution {
public:
    string sortVowels(string s) {
        unordered_set<char>vowels={'E','I','O','U','A','a','e','i','o','u'};
        string temp="";
        int n=s.length();
        for(int i=0;i<n;i++){
            if(vowels.find(s[i])!=vowels.end()){
                temp.push_back(s[i]);
            }
        }
        sort(temp.begin(),temp.end());
        int j=0;
        for(int i=0;i<n;i++){
            if(vowels.find(s[i])!=vowels.end()){
                s[i]=temp[j++];
            }
        }
        return s;
    }
};