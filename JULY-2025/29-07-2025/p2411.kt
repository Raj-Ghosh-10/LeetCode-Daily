class Solution {
    fun addElement(num:Int, dp:IntArray){
        for(i:Int in 0..31) if((1 shl i) and num > 0) dp[i] += 1
    }
    
    fun removeElement(num:Int, dp:IntArray): Boolean {
        for(i:Int in 0..31) if(dp[i] == 1 && (1 shl i) and num > 0) return false
        for(i:Int in 0..31) if((1 shl i) and num > 0) dp[i] -= 1

        return true
    }

    fun smallestSubarrays(nums: IntArray): IntArray {
        val n:Int = nums.size
        val dp:IntArray = IntArray(32){0}
        var r:Int = n-1

        val sol:IntArray = IntArray(n){0}

        for(i:Int in n-1 downTo 0){
            addElement(nums[i], dp)

            while(i<r && removeElement(nums[r], dp)) r--
            
            sol[i] = r-i+1
        }

        return sol
    }
}