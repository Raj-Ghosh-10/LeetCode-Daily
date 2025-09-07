class Solution {
    public long minOperations(int[][] queries) {
        long ans = 0;

        for (int[] q : queries) {
            int l = q[0];
            int r = q[1];

            long steps = solve(l, r);
            ans += (steps + 1) / 2;
        }

        return ans;
    }

    private long solve(int l, int r) {
        long L = 1, S = 1, steps = 0;

        while (L <= r) {
            long R = 4 * L - 1;

            long start = Math.max(L, (long) l);
            long end = Math.min(R, (long) r);

            if (start <= end) {
                steps += (end - start + 1) * S;
            }

            S++;
            L *= 4;
        }

        return steps;
    }
}