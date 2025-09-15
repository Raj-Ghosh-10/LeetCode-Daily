class Solution {
public:
    bool isVowel(char x){
        return (x=='a' || x=='e'|| x=='i'|| x=='o'|| x=='u');
    }

    vector<string> spellchecker(vector<string>& wordlist, vector<string>& queries) {
        vector<string> ans;

        // 1. Exact matches
        unordered_set<string> exact(wordlist.begin(), wordlist.end());
        
        // 2. Case-insensitive map
        unordered_map<string, int> lowerMap;
        for(int i=0; i<wordlist.size(); i++){
            string s = wordlist[i];
            transform(s.begin(), s.end(), s.begin(), ::tolower);
            if(lowerMap.find(s) == lowerMap.end())  // store only first match
                lowerMap[s] = i;
        }

        // 3. Vowel-error map
        unordered_map<string, int> vowelMap;
        for(int i=0; i<wordlist.size(); i++){
            string s = wordlist[i];
            transform(s.begin(), s.end(), s.begin(), ::tolower);
            for(char &c : s){
                if(isVowel(c)) c='*';
            }
            if(vowelMap.find(s) == vowelMap.end()) // store only first match
                vowelMap[s] = i;
        }

        // Process queries
        for(string q : queries){
            if(exact.find(q) != exact.end()){ 
                ans.push_back(q); 
                continue;
            }

            string lowerQ = q;
            transform(lowerQ.begin(), lowerQ.end(), lowerQ.begin(), ::tolower);
            if(lowerMap.find(lowerQ) != lowerMap.end()){ 
                ans.push_back(wordlist[lowerMap[lowerQ]]); 
                continue;
            }

            string vowelQ = lowerQ;
            for(char &c : vowelQ){
                if(isVowel(c)) c='*';
            }
            if(vowelMap.find(vowelQ) != vowelMap.end()){ 
                ans.push_back(wordlist[vowelMap[vowelQ]]); 
                continue;
            }

            ans.push_back("");
        }

        return ans;
    }
};