function largestGoodInteger(num: string): string {
    let maxGoodInteger = "";
    
    for (let i = 0; i <= num.length - 3; i++) {
        const substring = num.substring(i, i + 3);
        if (substring[0] === substring[1] && substring[1] === substring[2]) {
            if (substring > maxGoodInteger) {
                maxGoodInteger = substring;
            }
        }
    }
    
    return maxGoodInteger;
}