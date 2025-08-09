bool isPowerOfTwo(int n) {
    if(n <= 0) return false;

    // bitwise trick 
    return (n > 0) && (n & (n - 1)) == 0;
}