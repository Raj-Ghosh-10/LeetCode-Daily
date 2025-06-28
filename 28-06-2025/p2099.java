import java.util.PriorityQueue;

class Solution {
    public int[] maxSubsequence(int[] nums, int k) {
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> Integer.compare(a[0], b[0]));
        for (int i = 0; i < nums.length; i++) {
            pq.offer(new int[] { nums[i], i });
            if (pq.size() > k)
                pq.poll();
        }

        PriorityQueue<int[]> newPq = new PriorityQueue<>((a, b) -> Integer.compare(a[1], b[1]));
        newPq.addAll(pq);

        int[] res = new int[k];
        int i = 0;

        while (!newPq.isEmpty()) {
            int[] val = newPq.poll();
            res[i++] = val[0];
        }

        return res;
    }
}