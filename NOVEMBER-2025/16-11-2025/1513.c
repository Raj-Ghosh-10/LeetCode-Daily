#define MOD 1000000007;
int numSub(char* s) {
    long int count = 0;
    long int current = 0;
    int len = strlen(s);

    for(int i = 0; i < len; i++){
        if(s[i] == '1'){
            current++;
            count = (count + current) % MOD;
        }
        else{
            current = 0;
        }
    }

    return count;
}