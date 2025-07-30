class Solution {
    public int longestSubarray(int[] nums) {
        int maxVal=Integer.MIN_VALUE;
        int maxStreak=0;
        int streak=0;
        for(int num:nums) maxVal=Math.max(maxVal,num);
        for(int num:nums){
            if(num==maxVal){
                streak++;
                maxStreak=Math.max(maxStreak,streak);
            }else{
                streak=0;
            }
        }
        return maxStreak;
    }
}