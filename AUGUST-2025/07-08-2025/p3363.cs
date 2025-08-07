public class Solution {
    [System.Runtime.CompilerServices.SkipLocalsInit]
    public int MaxCollectedFruits(int[][] fruits) {
        int n=fruits.Length, n1=n-1;

        Span<int> ping=stackalloc int[n], pong=stackalloc int[n];
        
        // start with begin/end positions
        int ans=fruits[0][0] + fruits[^1][^1];
        
        // add from top/right to bottom/right
        int last=fruits[0][^1];
        if(n>2) {
            ping.Clear();
            ping[n1]=last;
            for(int i=1;;) {
                pong.Clear();
                var r=fruits[i];
                ans+=r[i++]; // add diagonal along the way
                for(int j=n-i>i?n-i:i; j<n;) {
                    int oj=j, best=ping[j++];
                    if(oj>0 && ping[oj-1]>best) best=ping[oj-1];
                    if(j<n && ping[j]>best) best=ping[j];
                    last=pong[oj]=best+r[oj];
                }
                if(i>=n1) break;

                ping.Clear();
                r=fruits[i];
                ans+=r[i++]; // add diagonal along the way
                for(int j=n-i>i?n-i:i; j<n;) {
                    int oj=j, best=pong[j++];
                    if (oj>0 && pong[oj-1]>best) best=pong[oj-1];
                    if (j<n && pong[j]>best) best=pong[j];
                    last=ping[oj]=best+r[oj];
                }
                if(i>=n1) break;
            }
        }
        ans+=last;

        // add from bottom/left to bottom/right
        last=fruits[^1][0];
        if(n>2) {
            ping.Clear();
            ping[n1]=last;
            for(int i=1;;) {
                pong.Clear();
                int oi=i++;
                for(int j=n-i>i?n-i:i; j<n;) {
                    int oj=j, best=ping[j++];
                    if(oj>0 && ping[oj-1]>best) best=ping[oj-1];
                    if(j<n && ping[j]>best) best=ping[j];
                    last=pong[oj]=best+fruits[oj][oi];
                }
                if(i>=n1) break;

                ping.Clear();
                oi=i++;
                for(int j=n-i>i?n-i:i; j<n;) {
                    int oj=j, best=pong[j++];
                    if(oj>0 && pong[oj-1]>best) best=pong[oj-1];
                    if(j<n && pong[j]>best) best=pong[j];
                    last=ping[oj]=best+fruits[oj][oi];
                }
                if(i>=n1) break;
            }
        }
        return ans+last;
    }
}