class Solution {
    public boolean isBeautiful(int num){
        int[] count = new int[10];
        while(num > 0){
            int digit = num % 10;
            count[digit]++;
            num = num / 10;
        }
        for(int i=0;i<10;i++){
            if(count[i] != 0 && count[i] != i)
                return false;
        }
        return true;
    }

    public int nextBeautifulNumber(int n) {
        for(int i=n+1;i<=1666666;i++){
            if(isBeautiful(i))
                return i;
        }  
        return 0;
    }
}