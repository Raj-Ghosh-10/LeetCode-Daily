#define MAX_POWER_3 1162261467

bool isPowerOfThree(int n) {
    return n>0&&MAX_POWER_3%n==0;
}