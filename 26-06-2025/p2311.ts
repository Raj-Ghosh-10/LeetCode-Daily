function longestSubsequence(s: string, k: number): number {
       let ones = 0;
       for(let i = s.length - 1 , sum = 0 , pw = 1; i >= 0 ; i-- , pw <<= 1 ) {
           if(sum + pw  > k)
               break;
          if(s[i] === '1') 
              ones++ , sum += pw ;
       }
       return ones + s.split("").filter(_ => _ === '0').length;
};