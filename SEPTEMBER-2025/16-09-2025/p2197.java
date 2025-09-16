class Solution {
    private long gcd(long a, long b){
        while (b != 0){
            long t = a % b;
            a = b;
            b = t;
        }
        return a;
    }
    public List<Integer> replaceNonCoprimes(int[] nums) {
        Deque<Long> st = new ArrayDeque<>();
        for (int i : nums){
            st.addLast((long)i);
            while (st.size() > 1){
                long a = st.removeLast();
                long b = st.removeLast();
                long g = gcd(a, b);
                if (g == 1){
                    st.addLast(b);
                    st.addLast(a);
                    break;
                } else {
                    long l = a / g * b;
                    st.addLast(l);
                }
            }
        }
        List<Integer> res = new ArrayList<>(st.size());
        for (long v : st)
            res.add((int)v);
        return res;
    }
}