int longestSubsequence(char* s, int k) {

    int len = strlen(s) - 1;
    unsigned int base = 1, sum = 0;
    int ans = 0;

    for (; len >= 0; len--) {
        sum += (s[len] - '0') * base;
        base *= 2;

        if (sum > k || base >= INT_MAX) {
            break;
        }
        else {
            ans++;
        }
    }

    for (; len >= 0; len--) {
        if (s[len] == '0') {
            ans++;
        }
    }

    return ans;
}