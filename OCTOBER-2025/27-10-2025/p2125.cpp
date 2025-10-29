class Solution {
public:
    int numberOfBeams(vector<string>& bank) {
        int n=bank.size();
        int laser=0;
        vector<int> temp;
        for(auto ch :bank){
            int one=0;
            for(int i=0;i<ch.length();i++){
                if(ch[i]=='1'){
                    one++;
                }
            }
            temp.push_back(one);
        }
        int prev = 0;
        while (prev < temp.size() && temp[prev] == 0) prev++; // Skip initial zero rows

        for (int i = prev + 1; i < temp.size(); i++) {
            if (temp[i] != 0) {
                laser += temp[prev] * temp[i];
                prev = i;
            }
        }
        return laser;
    }
};