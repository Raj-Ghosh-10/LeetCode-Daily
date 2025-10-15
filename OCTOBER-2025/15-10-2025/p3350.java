class Solution {
    public int maxIncreasingSubarrays(List<Integer> nums) {
        int n = nums.size();
        int inc = 1;
        int prevInc = 0;
        int ans = Integer.MIN_VALUE;

        for(int i = 1; i < n; i++){
            if(nums.get(i) > nums.get(i-1)){
                inc++;
            }
            else{
                prevInc = inc;
                inc = 1;
            }
            if(prevInc >= inc) ans = Math.max(ans, inc);
            else ans = Math.max(ans, inc/2);  
        }
        return ans;
    }
}