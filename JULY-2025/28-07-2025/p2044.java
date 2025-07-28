class Solution {
        private int maxOr=0;
        private int count=0;
    public int countMaxOrSubsets(int[] nums) {
        for(int num:nums)
        {
            maxOr |=num;
        }
        backtrack(nums,0,0);
        return count;        
    }
    private void backtrack(int[] nums,int idx,int curr)
    {
        if(idx==nums.length)
        {
            if(curr==maxOr)
            {
                count++;
            }
            return;
        }
        backtrack(nums,idx+1,curr |nums[idx]);
        backtrack(nums,idx+1,curr);
    }
}