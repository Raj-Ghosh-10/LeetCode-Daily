import java.util.ArrayList;
import java.util.List;

class Solution {
    // A small epsilon value to handle floating-point comparisons.
    private static final double EPSILON = 1e-6;
    private static final double TARGET = 24.0;

    public boolean judgePoint24(int[] cards) {
        List<Double> list = new ArrayList<>();
        for (int card : cards) {
            list.add((double) card);
        }
        return solve(list);
    }

    /**
     * Recursive backtracking function to find a solution.
     * @param nums The current list of numbers we can use.
     * @return True if a solution is found, false otherwise.
     */
    private boolean solve(List<Double> nums) {
        // Base case: If only one number is left, check if it's our target.
        if (nums.size() == 1) {
            return Math.abs(nums.get(0) - TARGET) < EPSILON;
        }

        // Recursive step: Pick any two distinct numbers from the list.
        for (int i = 0; i < nums.size(); i++) {
            for (int j = i + 1; j < nums.size(); j++) {
                
                // Create a new list for the next recursive call.
                // It will contain all numbers except the two we are operating on.
                List<Double> nextNums = new ArrayList<>();
                for (int k = 0; k < nums.size(); k++) {
                    if (k != i && k != j) {
                        nextNums.add(nums.get(k));
                    }
                }
                
                double a = nums.get(i);
                double b = nums.get(j);

                // Apply all possible operations (+, -, *, /) to the pair (a, b).
                // Note: a-b and b-a are different, as are a/b and b/a.
                List<Double> results = new ArrayList<>();
                results.add(a + b);
                results.add(a * b);
                results.add(a - b);
                results.add(b - a);
                if (Math.abs(b) > EPSILON) {
                    results.add(a / b);
                }
                if (Math.abs(a) > EPSILON) {
                    results.add(b / a);
                }

                // For each result, add it to the list and recurse.
                for (double res : results) {
                    nextNums.add(res);
                    if (solve(nextNums)) {
                        return true; // Solution found!
                    }
                    // Backtrack: remove the result to try the next operation.
                    nextNums.remove(nextNums.size() - 1);
                }
            }
        }

        // If no combination of operations from this state leads to a solution.
        return false;
    }
}