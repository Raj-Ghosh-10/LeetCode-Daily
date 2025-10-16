class Solution {
    public int findSmallestInteger(int[] nums, int value) {
        int[] cnt = new int[value];
        for (int x: nums){
            int m = mod(x, value);
            cnt[m]++;
        }
        int i = 0;
        while (true){
            int m = i % value;
            if (cnt[m] > 0) {
                cnt[m]--;
                i++;
            }else {
                return i;
            }
        }
    }
    public int mod(int num, int m){
        int raj = num % m;
        if (raj < 0){
            raj += m;
        } 
        return raj;
    }
}