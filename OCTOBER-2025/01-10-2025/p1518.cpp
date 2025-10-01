class Solution {
public:
    int numWaterBottles(int numBottles, int numExchange) {
        int drinked =0;
        int empty=0;
        while(numBottles>0){
            drinked+=numBottles;
            empty+=numBottles;
            numBottles=empty/numExchange;
            empty%=numExchange;
        }
        return drinked;
    }
};