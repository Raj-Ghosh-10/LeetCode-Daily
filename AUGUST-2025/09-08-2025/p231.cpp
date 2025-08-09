class Solution {
public:

    bool isPowerOfTwo(int n) {
        // for example 
        // if 4 is power of 2 then n-1 i.e 3 is exact opposite in set bot
        // 4 -> 100
        // 3 -> 011
        //   -> 000

        // 8 -> 1000
        // 7 -> 0111
        //   -> 0000
        return n > 0 && (n & (n - 1)) == 0;    
    }

/*
    bool isPowerOfTwo(int n) {
        // using built in function which count set bits i.e 1 from number
        if(n <=0 ){
            return 0;
        }
        int cnt = __builtin_popcount(n);
        // also note that there is always one set bit (1) is present in pow of 2
        // 4 -> 100
        // 8 -> 1000
        return cnt == 1;
    }
*/

/*
    // using loop
    bool isPowerOfTwo(int n) {
        if (n <= 0) return false;
        
        while (n % 2 == 0) {
            n /= 2;
        }
        // if we get reminder 1 then return true
        return n == 1;
    }
*/
};