class Solution {
public:
    bool reorderedPowerOf2(int n) {
        vector<int>k(10,0);
        while (n>0){k[n%10]++;n/=10;}
        for (int i=0;i<31;i++){
            vector<int>c(10,0);
            int x=pow(2,i);
            while (x>0){c[x%10]++;x/=10;}
            if (c==k){return true;}
        }
        return false;
    }
};