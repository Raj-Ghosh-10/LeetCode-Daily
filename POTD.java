class Solution {
    Map<Long, Integer> bitMemo = new HashMap<>();

    public int maxPartitionsAfterOperations(String s, int k) {
        return solve(0, 0, true, s, k) + 1;
    }

    private int solve(int i, long uniquechars, boolean canchange, String s, int k) {

        long key = ((long)i << 27) | ((uniquechars) << 1) | (canchange ? 1L : 0L);
        if (bitMemo.containsKey(key)) return bitMemo.get(key);

        if (i == s.length()) return 0;

        int charidx = s.charAt(i) - 'a';
        long newunique = uniquechars | (1L << charidx);
        int uniquecount = Long.bitCount(newunique);

        int result;
        if (uniquecount > k) {
            result = 1 + solve(i + 1, (1L << charidx), canchange, s, k);
        } else {
            result = solve(i + 1, newunique, canchange, s, k);
        }

        if (canchange) {
            for (int newidx = 0; newidx < 26; newidx++) {
                long newcharset = uniquechars | (1L << newidx);
                int newuniquecount = Long.bitCount(newcharset);

                if (newuniquecount > k) {
                    result = Math.max(result, 1 + solve(i + 1, (1L << newidx), false, s, k));
                } else {
                    result = Math.max(result, solve(i + 1, newcharset, false, s, k));
                }
            }
        }

        bitMemo.put(key, result);
        return result;
    }
}