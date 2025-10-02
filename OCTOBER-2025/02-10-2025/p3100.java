class Solution {
    public int maxBottlesDrunk(int numBottles, int numExchange) {
        int full=0;
        int empty=numBottles;
        int drink=numBottles;
        while(empty>=numExchange){
            empty=empty-numExchange;
            full++;
            numExchange++;
            drink+=full;
            full--;
            empty++;
        }
        return drink;
    }
}