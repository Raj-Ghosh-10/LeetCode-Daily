class Solution {
  int minimumOneBitOperations(int n) {
      int multiplier = 1;
        int res = 0;
        while(n > 0) {
            res += n ^ (n-1) * multiplier;
            multiplier = -1 * multiplier;
            n &= n-1;
        }
        if(res>=0){
            return res;
        }else{
            return -1*res;
        }
  }
}