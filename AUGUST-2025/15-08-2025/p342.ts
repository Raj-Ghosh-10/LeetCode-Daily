function isPowerOfFour(n: number): boolean {
    if (n == 1) return true
    if (n < 1 || (n / 4 - Math.floor(n / 4)) > 0) return false
    return isPowerOfFour(n / 4)
}