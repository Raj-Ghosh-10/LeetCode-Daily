class Solution {
public:
    int longestSubarray(vector<int>& nums) {
        int n = nums.size();
        int maxNums = nums[0];
        int count = 1;
        int ans = 1;
        for (int i = 1; i < n; i++) {
            if (nums[i] > maxNums) {
                maxNums = nums[i];
                count = 1;
                ans = count;
            } 
            else if (nums[i] == maxNums) {
                count++;
            } 
            else {
                // Some small number
                count = 0;
            }
            ans = max(ans, count);
        }
        return ans;
    }
};