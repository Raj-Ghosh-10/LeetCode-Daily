public class Solution {
    public int MaximumGain(string s, int x, int y) {
        int a=0, b=0, result=0;
        int start=0, step=1, end=s.Length;
        if(x<y) {
            (x,y)=(y,x); // swap x and y
            start=end-1; // proceed backwards through the string
            step=end=-1;
        }
        for(int i=start; i!=end; i+=step) {
            if(s[i]=='a') {
                a++;
            } else if(s[i]=='b') {
                if(a>0) {
                    a--;
                    result+=x;
                } else {
                    b++;
                }
            } else {
                result+=y*(a<b?a:b);
                a=b=0;
            }
        }
        return result+y*(a<b?a:b);
    }
}