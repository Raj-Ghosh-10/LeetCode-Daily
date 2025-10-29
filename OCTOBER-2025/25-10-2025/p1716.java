class Solution {
    public int totalMoney(int n) {
        int res = 0, avg = 4;
        while(n > 7) {
            res += avg++ * 7;
            n-=7;
        }
        while(n-- > 0) {
            res += n + avg - 3;
        }
        return res;
    }
}