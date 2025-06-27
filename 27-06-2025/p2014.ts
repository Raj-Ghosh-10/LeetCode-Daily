function longestSubsequenceRepeatedK(s: string, k: number): string {
    const check = (sub, s, k) => {
        let count = 0, i = 0;
        for (const c of s) {
            if (i < sub.length && c === sub[i]) {
                i++;
                if (i === sub.length) {
                    i = 0;
                    count++;
                    if (count === k) 
                        return true;
                }
            }
        }
        return false;
    };

    const freq = {};
    for (const c of s) {
        freq[c] = (freq[c] || 0) + 1;
    }

    const valid = [];
    for (let c = 122; c >= 97; c--) { 
        const ch = String.fromCharCode(c);
        if ((freq[ch] || 0) >= k) {
            valid.push(ch);
        }
    }

    const maxLen = Math.floor(s.length / k);
    let res = "";
    const q = [""];
    
    while (q.length > 0) {
        const curr = q.shift();
        for (const c of valid) {
            const next = curr + c;
            if (next.length > maxLen) 
                continue;
            if (check(next, s, k)) {
                if (
                    next.length > res.length || 
                    (next.length === res.length && next > res)
                ) {
                    res = next;
                }
                q.push(next);
            }
        }
    }

    return res;
};