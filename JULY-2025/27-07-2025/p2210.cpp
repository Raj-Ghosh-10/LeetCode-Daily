class Solution {
public:
    int countHillValley(vector<int>& nums)
    {
        int count = 0;
        int i = 1;
        while(i < (nums.size()-1))
        {
            int first = i;
            while(i+1 < (nums.size()-1) && nums[i+1] == nums[first]) i++;
            if(i == (nums.size()-1)) break;
            int last = i;
            if((nums[first] > nums[first-1] && nums[last] > nums[last+1]) || (nums[first] < nums[first-1] && nums[last] < nums[last+1])) count++;
            i++;
        }
        return count;
    }
};