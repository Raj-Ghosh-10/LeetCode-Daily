function makeFancyString(s: string): string {
    let counter = 1, ans = s[0];

    for (let i = 1, n = s.length; i < n; i++) {
        if (s[i - 1] === s[i]) {
            counter++;
        } else counter = 1;

        if (counter > 2) {
            continue;
        }

        ans += s[i];
    }

    return ans;
};