class Solution {
public:
    long long zeroFilledSubarray(vector<int>& nums) {
        long long result = 0;
        int l = 0, r = 0;
        for (; r < nums.size(); ++r) {
            if (nums[r] == 0) continue;
            result += (long long) (r - l) * (r - l + 1) / 2;
            l = r + 1;
        }
        result += (long long) (r - l) * (r - l + 1) / 2;
        return result;
    }
};