class Solution {
    val MOD = 1_000_000_007L
    fun numSub(s: String): Int {
        val len = s.length
        var count = 0L
        var sum = 0L
        for(i in 0 until len){
            if(s[i]=='1'){
                count = count+1
            }
            else{
                sum+=(count*(count+1)/2)%MOD
                count=0
            }
        }
        sum+=(count*(count+1)/2)%MOD
        return sum.toInt()
    }
}