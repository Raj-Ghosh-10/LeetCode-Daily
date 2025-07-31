class Solution {
    public int subarrayBitwiseORs(int[] arr) {
        Set<Integer> ans = new HashSet<>();
        Set<Integer> prev = new HashSet<>();
        for(int x : arr) {
            Set<Integer> cur = new HashSet<>();
            for(int y : prev) {
                cur.add(y | x);
            }
            cur.add(x);
            prev = cur;
            ans.addAll(cur);
        }

        return ans.size();
    }
}