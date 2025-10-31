class Solution {
public:
    vector<int> getSneakyNumbers(vector<int>& nums) {
        int xo = 0;
        int n = nums.size() - 2;
        for (int num : nums) {
            xo ^= num;
        }
        for (int i = 0; i < n; i++) {
            xo ^= i;
        }
        int diff = xo & -xo;
        int a = 0, b = 0;
        for (int num : nums) {
            if (num & diff) b ^= num;
            else a ^= num;
        }
        for (int i = 0; i < n; i++) {
            if (i & diff) b ^= i;
            else a ^= i;
        }
        return {a, b};
    }
};