func maximumGain(s string, x int, y int) int {
    ans := 0
    st := make([]byte, 0)

    first, second := "ab",  "ba"
    if x < y {
        first, second = second, first
    }

    for i := 0; i< len(s); i++{
        st = append(st, s[i])
        for len(st) > 1 && st[len(st) - 2] == first[0] && st[len(st)-1] == first[1]{
            ans += max(x, y)
            st = st[:len(st)-2]
        }
    }


    s = string(st)
    st = make([]byte, 0)
    for i := 0; i < len(s); i++{
        st = append(st, s[i])
        if len(st) > 1 && st[len(st) - 2] == second[0] && st[len(st) - 1] == second[1] {
            ans += min(x, y)
            st = st[:len(st)-2]
        }
    }
    return ans
}