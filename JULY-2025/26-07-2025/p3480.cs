public class Solution {
    public long MaxSubarrays(int n, int[][] conflictingPairs) {
        var leftsConflicts = new List<int>[n + 1];
        foreach (var conflictingPair in conflictingPairs)
        {
            var left = conflictingPair[0];
            var right = conflictingPair[1];
            if (left > right)
                (left, right) = (right, left);
            
            if (leftsConflicts[right] is null)
                leftsConflicts[right] = new List<int>();
            
            leftsConflicts[right]!.Add(left);
        }

        int leftMin = 0, secondLeftMin = 0;
        long ans = 0;
        long maxPotential = 0;
        long[] potential = new long[n + 1];
        for (int i = 1; i <= n; i++)
        {
            if (leftsConflicts[i] is not null)
            {
                foreach (var left in leftsConflicts[i]!)
                {
                    if (left > leftMin)
                    {
                        secondLeftMin = leftMin;
                        leftMin = left;
                    }
                    else if (left > secondLeftMin)
                    {
                        secondLeftMin = left;
                    }
                }
            }

            ans += i - leftMin;
            potential[leftMin] += leftMin - secondLeftMin;
            maxPotential = Math.Max(maxPotential, potential[leftMin]);
        }

        return ans + maxPotential;
    }
}