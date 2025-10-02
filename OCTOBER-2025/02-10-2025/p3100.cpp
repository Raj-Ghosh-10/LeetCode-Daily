class Solution {
public:
    int fillBottles(int & emptyBottles, int & numExchange) {
        int filledBottles = 0;

        while (numExchange <= emptyBottles) {
            filledBottles++;
            emptyBottles -= numExchange;
            numExchange++;
        }
        return filledBottles;
    }
    int maxBottlesDrunk(int numBottles, int numExchange) {

        int bottlesDrunk = 0;
        int filledBottles = numBottles;
        int emptyBottles = 0;

        while (filledBottles > 0) {
            bottlesDrunk += filledBottles;
            emptyBottles += filledBottles;
            filledBottles = fillBottles(emptyBottles, numExchange);
        }

        return bottlesDrunk;
    }
};