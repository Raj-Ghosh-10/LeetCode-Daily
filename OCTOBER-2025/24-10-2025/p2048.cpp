class Solution {

public:
    int nextBeautifulNumber(int n) {
        while(true){
            n++;
            vector<int>freq(10,0);


            int temp =n;
            while(temp){
                freq[temp%10]++;
                temp/=10;
            }


             bool isBalanced = true;
             for(int i=0 ; i<10 ; i++){
                if(freq[i]!=0 && freq[i]!=i){
                    isBalanced=false;
                    break;
                }
             }

              if (isBalanced) return n; 

        }
    }
};