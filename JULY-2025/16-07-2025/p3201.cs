public class Solution {
    public int MaximumLength(int[] nums) {
       int even = 0;
       int odd = 0;

       foreach(int i in nums)
       {
            if(i % 2 == 0)
            {
                even++;
            }
            else
            {
                odd++;
            }
       }

       int parity = nums[0] % 2; 
       int alternate = 1;
       for(int i = 1; i < nums.Length; i++)
       {
        int currParity = nums[i] % 2;
            if(parity != currParity)
            {
                alternate++;
                parity = currParity;

            }
       }
       return Math.Max(alternate, Math.Max(even, odd)); 
    }
}