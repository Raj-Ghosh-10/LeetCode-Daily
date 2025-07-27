public class Solution {
    public int CountHillValley(int[] nums) {
        int pr = 0,cnt=0;
        for(int i=0;i<nums.Length-1;i++)
        {
            if((pr>0 && nums[i]>nums[i+1])||(pr<0 && nums[i]<nums[i+1]))cnt++;
            if(nums[i]!=nums[i+1])
             {
                if(nums[i]>nums[i+1]) pr=-1;
                                 else pr=1;
             }
        }
        return cnt;
    }
}