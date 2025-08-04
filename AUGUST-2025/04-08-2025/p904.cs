public class Solution {
    public int TotalFruit(int[] fruits) {
        int maxFruits = 0;
        int lastFruit = -1, secondLastFruit = -1;
        int lastFruitCount = 0; // count of consecutive lastFruit at window end
        int currentMax = 0;

        for (int i = 0; i < fruits.Length; i++) {
            int fruit = fruits[i];

            if (fruit == lastFruit || fruit == secondLastFruit) {
                currentMax += 1;
            } else {
                currentMax = lastFruitCount + 1; // jump left to where lastFruit streak started
            }

            if (fruit == lastFruit) {
                lastFruitCount += 1;
            } else {
                lastFruitCount = 1;
                secondLastFruit = lastFruit;
                lastFruit = fruit;
            }

            maxFruits = Math.Max(maxFruits, currentMax);
        }

        return maxFruits;
    }
}