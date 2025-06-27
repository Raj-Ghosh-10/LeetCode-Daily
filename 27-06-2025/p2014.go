func longestSubsequenceRepeatedK(s string, k int) string {
    occ := [26]int{}
    for i := range s {
        occ[int(s[i]-'a')]++
    }
    n := len(s)
    maxStr := ""

    var dfs func(candidate string, currOcc [26]int)
    dfs = func(candidate string, currOcc [26]int) {
        if len(candidate) == n/k {
            return
        }

        for letter := 'z'; letter >= 'a'; letter-- {
            idx := int(letter - 'a')
            if currOcc[idx]+1 > occ[idx]/k {
                continue
            }

            next := candidate + string(letter)
            currOcc[idx]++

            if isSubsequence(s, strings.Repeat(next, k)) {
                maxStr = maxLen(maxStr, next)
                dfs(next, currOcc)
            }

            currOcc[idx]--
        }
    }

    dfs("",[26]int{})
    return maxStr
}

func isSubsequence(s,sub string) bool {
    subIdx := 0
    for sIdx := 0; sIdx < len(s) && subIdx < len(sub); sIdx++ {
        if s[sIdx] == sub[subIdx] {
            subIdx++
        }
    }

    return subIdx == len(sub)
}

func maxLen(x,y string) string {
    if len(x) >= len(y) {
        return x
    }
    return y
}