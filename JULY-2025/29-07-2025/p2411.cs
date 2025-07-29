public class Solution {
    public int[] SmallestSubarrays(int[] nums) {
        int n = nums.Length;
        int[] answer = new int[n];
        int[] lastSeen = new int[32];
        for (int i = 0; i < 32; i++) {
            lastSeen[i] = -1;
        }

        for (int i = n - 1; i >= 0; i--) {
            for (int bit = 0; bit < 32; bit++) {
                if ((nums[i] & (1 << bit)) != 0) {
                    lastSeen[bit] = i;
                }
            }

            int farthest = i;
            for (int bit = 0; bit < 32; bit++) {
                if (lastSeen[bit] != -1) {
                    farthest = Math.Max(farthest, lastSeen[bit]);
                }
            }

            answer[i] = farthest - i + 1;
        }

        return answer;
    }
}