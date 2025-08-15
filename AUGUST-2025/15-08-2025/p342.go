func isPowerOfFour(n int) bool {
    x := 1
    for x<n { x *= 4 }
    return x==n
}