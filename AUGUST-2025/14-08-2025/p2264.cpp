class Solution {
public:
    string largestGoodInteger(string num) {
        for (char d = '9'; d >= '0'; d--) {
            string triple(3, d);
            if (num.find(triple) != string::npos) {
                return triple;
            }
        }
        return "";
    }
};