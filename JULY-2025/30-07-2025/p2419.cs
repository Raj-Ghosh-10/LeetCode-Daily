public class Solution {
    public int LongestSubarray(int[] nums) {
        int max = 0; // highest nums value found so far
        int count = 0; // running count of max nums currently found
        int precord = 1; // previous record (will be at least 1)

        for (int i=0; i<nums.Length; i++)
        {
            if (nums[i] < max) // sqeuence ended/invalid
            {                
                count = 0;
            }

            if (nums[i] == max) // best candidate, start/keep counting
            {
                count++;
                if (count > precord) precord = count; // also check for record setting
            }

            if (nums[i] > max) // new max
            {
                max = nums[i];
                count = 1;
                precord = 1;
            }
        }
        
        return precord;
    }
}