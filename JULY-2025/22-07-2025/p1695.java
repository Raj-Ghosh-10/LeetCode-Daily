class Solution {
    public int maximumUniqueSubarray(int[] nums) {
        Set<Integer> set=new HashSet<>();
        int max=0;
        int curr=0;
        int l=0;
        for(int r=0;r<nums.length;r++){
            if(!set.contains(nums[r])){
                set.add(nums[r]);
                curr+=nums[r];
            }
            else{
                max=Math.max(curr,max);
                while(set.contains(nums[r])){
                    curr-=nums[l];
                    set.remove(nums[l]);
                    l++;
                }
                r--;
            }
        }
        max=Math.max(curr,max);
        return max;
    }
}