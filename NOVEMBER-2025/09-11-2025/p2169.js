var countOperations = function (num1, num2) {
    let res = 0;
    while (num1 && num2) {
        res += Math.floor(num1 / num2);
        num1 %= num2;
        [num1, num2] = [num2, num1];
    }
    return res;
};