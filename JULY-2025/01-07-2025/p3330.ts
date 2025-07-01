function possibleStringCount(word: string): number {
    let preChar: string = word[0];
    let ans = 1;
    for (let i = 1; i < word.length; i ++) {
        if (word[i] !== preChar) preChar = word[i];
        else ans ++;
    }
    return ans;
};