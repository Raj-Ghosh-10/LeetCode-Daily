class Solution {
    public int triangularSum(int[] nums) {
        int n = nums.length;
        if(n == 0 || n == 1) return nums[0];

        for(int step = 1; step < n; step++){
            for(int i = 0; i < n - step; i++){
                nums[i] = (nums[i] + nums[i+1]) % 10;
            }
        }
        return nums[0];
    }
}