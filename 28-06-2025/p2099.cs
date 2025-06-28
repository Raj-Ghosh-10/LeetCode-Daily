public class Solution {
    public int[] MaxSubsequence(int[] nums, int k) {
        var h = new PriorityQueue<int, int>();

        // T: O(nlogk), S:O(k)
        for (var i = 0; i < nums.Length; ++i)
        {
            if (h.Count == k
                && h.TryDequeue(out var oldI, out var oldVal)
                && nums[i] < oldVal
            )
            {
                // O: T(logk)
                h.Enqueue(oldI, oldVal);
                continue;
            }

            // O: T(logk)
            h.Enqueue(i, nums[i]);
        }

        var h2 = new PriorityQueue<int, int>();

        // T: O(k), S:O(n)
        while (h.TryDequeue(out var i, out var _))
        {
            h2.Enqueue(i, i);
        }

        var result = new int[k];
        // T: O(k)
        for (var i = 0; i < k; ++i)
        {
            result[i] = nums[h2.Dequeue()];
        }

        return result;
    }
}