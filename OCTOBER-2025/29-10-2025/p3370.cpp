class Solution {
public:
    int smallestNumber(int n) {
        int num = 2, temp = n;
        while (temp > 0) {
            num <<= 1;
            temp >>= 1;
        }
        return (num >> 1) - 1;
    }
};