bool reorderedPowerOf2(int n) {
    int power = 0;
    int temp = n; // dont alter the original n.
    int hash[10] = {0}; //use this array to store digits of n.
    if(n==1){
        return true;
    }
    while(temp>0){
        hash[temp%10]++;
        temp /= 10;
        power++; // this helps us know the power of 10 we need to express n in.
    } 
    long long num = 1;
    int power2 = 0;
    long long curr = 10;
    while(power2 < power-1){ 
//power-1 because we would need to stay in the same power as n
        if(num < curr){
            num *= 2; // keep checking the powers of 2 
        }
        else{
            power2++;
            curr *= 10; // this is to know the maximum ceiling for num
        }
    }
    while(num < curr){
        int newHash[10] = {0};
        temp = num;
        while(temp>0){
            newHash[temp%10]++; 
// use this to check for the digits of temp and compare them with n
            temp /= 10;
        }
        bool rearranged = true;
//we are only storing digits from 0-9 since any number % 10 would give digits from 0-9.
        for(int i=0;i<10;i++){
            if(hash[i]!= newHash[i]){
                rearranged = false;
            }
        }
        if(rearranged){
            return true;
        }
        num *= 2;
    }
    return false;
}