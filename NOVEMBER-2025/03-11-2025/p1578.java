class Solution {
    public int minCost(String colors, int[] neededTime) {
        char[] arr = colors.toCharArray();
        int res = 0;
        for (int i = 1; i < arr.length; i++) {
            if (arr[i] == arr[i - 1]) {
                int total = neededTime[i - 1];
                int max = neededTime[i - 1];
                while (i < arr.length && arr[i] == arr[i - 1]) {
                    total += neededTime[i];
                    max = Math.max(max, neededTime[i]);
                    i++;
                }
                res += total - max;
            }
        }
        return res;
    }
}