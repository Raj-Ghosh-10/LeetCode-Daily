class Solution {
  int numSub(String s) {
    int count=0;
    int result=0;
    int sumofn=0;
    for(int i=0;i<s.length;i++){
        if(s[i]=='1'){
            count++;
        }else{
            sumofn=(count*(count+1))~/2;
            result+=sumofn;
            count=0;
        }
    }
    sumofn=(count*(count+1))~/2;
    result+=sumofn;
    return result%1000000007;
    }
}