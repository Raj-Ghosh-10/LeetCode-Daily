class Solution {
    public int countHillValley(int[] nums) {
        int res = 0;
        for (int i = 1;i<nums.length-1;i++) {
            if (nums[i] == nums[i-1]) {continue;}

            int j = i+1;
            while(i<nums.length-1 && j<nums.length-1 && nums[i] == nums[j]) {
                j++;
            }
            if (nums[i] < nums[i-1] && nums[i] < nums[j]) {
                res++;
            }
            if (nums[i] > nums[i-1] && nums[i] > nums[j]) {
                res++;
            }
            i = j-1;
        }
        return res;
    }
}