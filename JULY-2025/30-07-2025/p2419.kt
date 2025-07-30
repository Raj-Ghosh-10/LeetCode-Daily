class Solution {
    fun longestSubarray(nums: IntArray): Int {

        val maxvalue = nums.maxOrNull()?:0
        var current =0
        var longest =0

        for(num in nums){
            if(num==maxvalue){
                current++
                longest = maxOf(current,longest)
            }else{
                current =0
            }
        }
        return longest
        
    }
}