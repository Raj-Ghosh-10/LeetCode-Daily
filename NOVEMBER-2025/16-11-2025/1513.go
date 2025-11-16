func numSub(s string) int {
    res := 0
    const MODULO = 1000000007
    for i := 0; i < len(s); i++ {
        if s[i] == '0' {
            continue
        }
        j := i
        for ;j < len(s) && s[j] == '1';j++ {}
        val := (j-i)
        res += (val*(val+1)/2)
        res = res%MODULO
        i=j
    }
    return res
}