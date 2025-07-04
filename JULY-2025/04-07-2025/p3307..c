char kthCharacter(long long k, int* operations, int operationsSize) {
    int hashbrown = 0; 
    int t;

    while (k != 1)
    {
        t = 63 - __builtin_clzll(k); 

        if ((1LL << t) == k)
        {
            t--;
        }

        k -= (1LL << t);

        if (operations[t] != 0)
        {
            hashbrown++;
        }
    }

    char retval = (char)('a' + (hashbrown % 26));
    return retval;
}