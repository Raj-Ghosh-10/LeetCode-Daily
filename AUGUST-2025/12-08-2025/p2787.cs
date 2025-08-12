public class Solution {
    public int NumberOfWays(int n, int x) {
        List<int> powers = new List<int>();
          int i = 1;

          while(true){
               int val =1;

               for(int j =0; j < x;j++){
                   val *=i;

                    if(val > n) break;
               }

            if(val > n) break;

           powers.Add(val);
           i++;
          }
        
      int MOD = 1_000_000_007;
     int[] dp = new int[n+1];
     dp[0] = 1;

    foreach(int power in powers){
        for(int j = n;j >= power;j--){
            dp[j] = (dp[j] + dp[j-power]) % MOD;
        }
    }
   return dp[n];

    }
}