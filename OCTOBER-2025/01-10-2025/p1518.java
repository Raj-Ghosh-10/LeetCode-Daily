class Solution {
    public int numWaterBottles(int bottle, int exchange) {
       int ans=bottle;
       int empty=bottle;
       while(empty>=exchange){
        int filled=empty/exchange;
        ans+=filled;
        empty=(empty%exchange)+filled;
       }
        return ans;
    }
}