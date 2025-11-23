class Solution {
    public int maxSumDivThree(int[] nums) {
        int sum = 0;
        int m1a = Integer.MAX_VALUE, m1b = Integer.MAX_VALUE;
        int m2a = Integer.MAX_VALUE, m2b = Integer.MAX_VALUE;

        for (int x : nums) {
            sum += x;
            int r = x % 3;

            if (r == 1) {
                if (x < m1a) { m1b = m1a; m1a = x; }
                else if (x < m1b) m1b = x;
            } else if (r == 2) {
                if (x < m2a) { m2b = m2a; m2a = x; }
                else if (x < m2b) m2b = x;
            }
        }

        int rem = sum % 3;
        if (rem == 0) return sum;

        int remove = Integer.MAX_VALUE;

        if (rem == 1) {
            remove = Math.min(m1a, 
                     (m2a == Integer.MAX_VALUE || m2b == Integer.MAX_VALUE) ? 
                       Integer.MAX_VALUE : m2a + m2b);
        } else {
            remove = Math.min(m2a, 
                     (m1a == Integer.MAX_VALUE || m1b == Integer.MAX_VALUE) ? 
                       Integer.MAX_VALUE : m1a + m1b);
        }

        return remove == Integer.MAX_VALUE ? 0 : sum - remove;
    }
}