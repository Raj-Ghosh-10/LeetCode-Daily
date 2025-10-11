class Solution {
    public long maximumTotalDamage(int[] power) {
        Map<Integer, Long> map = new HashMap<>();
        for (int p : power) {
            map.put(p, map.getOrDefault(p, 0L) + p);
        }
        List<Integer> vals = new ArrayList<>(map.keySet());
        Collections.sort(vals);
        int m = vals.size();
        long[] raj = new long[m];
        raj[0] = map.get(vals.get(0));
        for (int i = 1; i < m; i++) {
            long gain = map.get(vals.get(i));
            int left = 0, right = i - 1, j = -1;
            while (left <= right) {
                int mid = (left + right) / 2;
                if (vals.get(mid) <= vals.get(i) - 3) {
                    j = mid;
                    left = mid + 1;
                } else {
                    right = mid - 1;
                }
            }
            long include = gain + (j >= 0 ? raj[j] : 0);
            long exclude = raj[i - 1];
            raj[i] = Math.max(include, exclude);
        }
        return raj[m - 1];
    }
}