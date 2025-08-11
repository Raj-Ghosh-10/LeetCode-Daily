public class Solution {
    public int[] ProductQueries(int n, int[][] q) {
        string s="";
        while (n!=0){
            if(n%2==1)s='1'+s;
            else s='0'+s;
            n/=2;
        }
List<int> l= new List<int>();
int pro=1;
for(int i=s.Length-1;i>=0; i--){
    if(s[i]=='1')l.Add(pro);
    pro*=2;
}
l.Sort();
int[]ans= new int[q.Length];
int[] a= l.ToArray();



for (int i=0; i< q.Length; i++){
    long x=1;
    for(int j=q[i][0]; j<=q[i][1];j++){
        x*=a[j];
        x%=1000000007;
    }
    ans[i]=(int)x;
    
}
return ans;
    }
}