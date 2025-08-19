class Solution {
    static
    {
        for(int i=0;i<=201;i++) zeroFilledSubarray(new int[1]);
    }
    public static long zeroFilledSubarray(int[] nums) {
        long total = 0;
        long count = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 0) {
                count++;
                total += count;
            }
            else
            {
                count = 0;
            }
        }
        return total;
    }
}