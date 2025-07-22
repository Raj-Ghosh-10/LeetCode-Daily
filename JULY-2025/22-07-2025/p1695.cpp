class Solution {
public:
    int maximumUniqueSubarray(vector<int>& nums) {
        int res = 0, currSum = 0, l = 0, r = 0;
        unordered_set<int> arr;
        while (r < nums.size()) {
            if (arr.find(nums[r]) == arr.end()) {
                arr.insert(nums[r]);
                currSum += nums[r];
                res = max(res, currSum);
                r++;
            }
            else {
                while (arr.find(nums[r]) != arr.end()) {
                    arr.erase(nums[l]);
                    currSum -= nums[l];
                    l++;
                }
            }
        }
        return res;
    }
};