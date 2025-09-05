class Solution {
    public int makeTheIntegerZero(int num1, int num2) {
       for(long i =0; i <= 60 ; ++i){
        long target = num1 - i * num2;

        if(Long.bitCount(target) <= i && i <= target)
        return (int) i;
       } 
       return -1;
    }
}