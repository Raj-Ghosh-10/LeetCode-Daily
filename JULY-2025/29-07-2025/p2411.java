class Solution {
    public int[] smallestSubarrays(int[] nums) {
        int n = nums.length, pos[] = new int[31], ans[] = new int[n];
        Arrays.fill(pos,-1);
        for(int i=n-1;i>=0;i--){
            int j = i;
            for(int bit=0;bit<31;bit++){
                if((nums[i]&(1<<bit))==0){
                    if(pos[bit]!=-1){
                        j = Math.max(j,pos[bit]);
                    }
                }
                else{
                    pos[bit] = i;
                }
            }
            ans[i] = j-i+1;
        }
        return ans;
    }
}