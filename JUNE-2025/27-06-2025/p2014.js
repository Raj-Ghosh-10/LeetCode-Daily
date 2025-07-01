/**
 * @param {string} s
 * @param {number} k
 * @return {string}
 */
var longestSubsequenceRepeatedK = function (s, k) {
    let freq = new Map()
    for (const c of s) {
        freq.set(c, (freq.get(c) || 0) + 1)
    }
    let hot = []
    for (const [key, val] of freq.entries()) {
        for (let i = 0; i < Math.floor(val / k); i++) {
            hot.push(key)
        }
    }
    if (!hot.length) return ''
    function combinations(arr, r) {
        let output = []
        let n = arr.length
        let used = Array(n).fill(false)
        function dfs(at, remain) {
            if (remain === 0) {
                let res = []
                for (let i = 0; i < n; i++) {
                    if (used[i]) {
                        res.push(arr[i])
                    }
                }
                output.push(res)
                return
            }
            for (let i = at; i < n; i++) {
                if (!used[i]) {
                    used[i] = true
                    dfs(at + 1, remain - 1)
                    used[i] = false
                }
            }
        }

        dfs(0, r)
        return output
    }
    function permutations(arr) {
        let output = []
        let n = arr.length
        let used = Array(n).fill(false)
        let picked = Array(n).fill(-1)
        function dfs(at) {
            if (at >= n) {
                let res = []
                for (let i = 0; i < n; i++) {
                    res.push(arr[picked[i]])
                }
                output.push(res)
                return
            }
            for (let i = 0; i < n; i++) {
                if (!used[i]) {
                    used[i] = true
                    picked[at] = i
                    dfs(at + 1)
                    used[i] = false
                }
            }
        }

        dfs(0)
        return output
    }
    function isSubsequence(str) {
        let j = 0
        for (let i = 0; i < s.length; i++) {
            if (s[i] === str[j]) {
                j++
            }
        }
        return j === str.length
    }
    let comb = new Set()
    for (let i = 1; i < hot.length + 1; i++) {
        for (const cand of combinations(hot, i)) {
            for (permu of permutations(cand)) {
                comb.add(permu.join(''))
            }
        }
    }
    comb = Array.from(comb).sort((a, b) => b.length - a.length || b.localeCompare(a))
    for (const el of comb) {
        if (isSubsequence(el.repeat(k))) return el
    }
};