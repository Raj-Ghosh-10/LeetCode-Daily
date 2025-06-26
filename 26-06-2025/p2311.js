var longestSubsequence = function (s, k) {
    let count = 0, j = s.length - 1, i = 0, acc = 0;
    while (j >= 0) {
        let positionNumber = Number(s[j]) * Math.pow(2, i);
        j--;
        i++;
        if (acc + positionNumber > k) continue;
        acc += positionNumber;
        count++;
    }
    return count;
};