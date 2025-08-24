class Solution {
    public int longestSubarray(int[] nums) {
        int ml=0;
        int pc=0;
        int cc=0;
        for(int i=0;i<nums.length;i++){
            if(nums[i]==1){
                cc++;
            }else{
                ml=Math.max(ml,pc+cc);
                pc=cc;
                cc=0;
            }
            ml=Math.max(ml,pc+cc);
            if(ml==nums.length){
                ml--;
            }
        }
        return ml;
        

        
    }
}