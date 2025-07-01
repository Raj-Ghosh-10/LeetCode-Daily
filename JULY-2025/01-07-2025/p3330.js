var possibleStringCount = function(word) {
    let ans = 1;                                   // perfect case
    for (let i = 0; i < word.length; ) {
        let j = i;
        while (j < word.length && word[j] === word[i]) j++;
        ans += (j - i - 1);                        // add L‑1
        i = j;
    }
    return ans;
};