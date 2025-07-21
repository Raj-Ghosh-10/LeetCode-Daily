func makeFancyString(s string) string {
    ans := []byte{}

    for i := 0 ; i<len(s) ; i++ {
        j := i+1
        c := 1 ;
        ans = append(ans , s[i])
        for j<len(s) && s[j] == s[j-1] {
            if c < 2 {
                ans = append(ans , s[j])
            }
            j++;
            c++;
        }

        i = j-1
    }

    return string(ans)
}