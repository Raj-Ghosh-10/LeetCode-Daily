class Solution {
    public int maximum69Number (int num) {
        int ans = num;
        int digit = 0;
        int cnt = 1;
        while(num > 0){
           if(num % 10 == 6){
            digit = cnt;
           }
           cnt++;
           num = num / 10;
        }

        String s1 = String.valueOf(ans);
        int indexToChange = s1.length() - digit;
        
        if(digit==0){
            return ans;
        }
        String newStr = s1.substring(0, indexToChange) + "9" + s1.substring(indexToChange+1, s1.length());

        return Integer.parseInt(newStr);
    }
}