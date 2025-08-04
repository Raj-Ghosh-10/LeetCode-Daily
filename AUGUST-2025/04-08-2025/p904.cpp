class Solution {
public:
    int totalFruit(vector<int>& nums){
        if(nums.size() == 1){
            return 1;
        }

        int maxfruite  = 1;
        int l=0;
        int r=1;
        int leftfruite = nums[0];
        while(r<nums.size() && nums[r] == leftfruite){
            r++;
        }
    
        if(r == nums.size()){
            r--;
        }
        int rightfruite = nums[r];
        maxfruite = max(maxfruite,r-l+1);
        r++;
        while(r<nums.size()){
            if(nums[r] != leftfruite && nums[r] != rightfruite){
                rightfruite = nums[r];
                l = r-1;
                leftfruite = nums[l];
                while(l>=0 && leftfruite == nums[l]){
                    l--;
                }
                l++;
            }

            maxfruite = max(maxfruite,r-l+1);
            r++;
        }
        return maxfruite;
    }
};