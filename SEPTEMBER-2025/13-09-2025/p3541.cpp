class Solution {
public:
    int maxFreqSum(string s) {
        int vowels = 0;
        int consonants = 0;
        int n = s.size();
        map<char, int> mpp;
        for (int i = 0; i < n; i++) {
            mpp[s[i]]++;
        }
        for (auto it : mpp) {
            char f = it.first;
            int s = it.second;
            if (f == 'a' || f == 'e' || f == 'i' || f == 'o' || f == 'u') {
                int count = s;
                vowels = max(count, vowels);
            } else {
                int count = s;
                consonants = max(count, consonants);
            }
        }
        return vowels + consonants;
    }
};