class Solution {
    public int[] getNoZeroIntegers(int n) {
        int[] ans = new int[2];
        int n1=0,n2=0;
        for(int i=1;i<=n;i++){
            if(i%10==0)continue; // i : 10,20,30
            n1 = i; // n1 safe;
            n2 = n - i;
            if (!containsZero(n2) && !containsZero(n1)){
                ans[0]  = n1;
                ans[1]  = n2;
                break;
            }
        }
        return ans;
    }
    public boolean containsZero(int n){
        int rem = 0;
        while(n>0){
            rem = n%10;
            if(rem==0)return true; // containsZero
            n/=10;
        }
        return false;
    }
}