class Solution {
public:
    int maximum69Number (int num) {
        int n = num;
        for (int p = 1e9; p > 0; p /= 10){
            if (num / p == 6){
                return n + 3 * p;
            }
            num = num % p;
        }
        return n;
    }
};