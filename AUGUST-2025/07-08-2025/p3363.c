
int maxCollectedFruits(int** fruits, int fruitsSize, int* fruitsColSize) {
    int n = fruitsSize;
    int res=0;
    for (int i=0;i<n;i++){
       res+=fruits[i][i];
    }  int max(int a, int b){
            return (a>b)?a:b;
        }
         void swap(int *a, int *b)
    {
        int temp = *a;
        *a = *b;
        *b = temp;
    }
    // rolling dp, chi can tao 2 mang 1 c, mang kia an theo 
    
    int dp()
    {
        // cho vao trong dp
    int *prev =malloc(n*sizeof(int));
    int *curr =malloc(n*sizeof(int));
    memset(prev, INT_MIN, sizeof(prev));
    memset(curr, INT_MIN, sizeof(curr));
    // xet thang goc tren phai trc, thg kia dao lai la xong
    prev[n-1] = fruits[0][n-1];
    // cchi can den o (n-2, n-1) la done
      for (int i=1;i<n-1;i++)
      {
        for (int j= max(n-i-1, i+1);j<n;j++)
        {
            int best = prev[j]; // chay thang xuong
            if (j-1>=0)
            {
                best = max(best, prev[j-1]); //cheo trai
            }
            if(j+1<n)
            {
                best = max(best, prev[j+1]); // cheo phai
            }
            curr[j] = best + fruits[i][j];// hoa qua max o nhung o truoc cung voi o hien tai
        }
        int *temp = prev;
        prev = curr;
        curr = temp;
      }
      return prev[n-1]; // la no n-2, n-1 can tim
    }
    res += dp();
   
    for (int i=0;i<n;i++)
    {
        for (int j=0;j<i;j++)
        {
            swap(&fruits[j][i],&fruits[i][j]);
        }
    }
    res += dp();
    return res;
}