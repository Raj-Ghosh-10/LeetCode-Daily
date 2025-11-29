public class Solution {
    public int MinOperations(int[] nums, int k) {
        int sum = 0;
        foreach (int x in nums) sum += x;
        return sum % k;
    }
}