const numberOfWays = (n: number, x: number): number => {
    const MODULO = 1e9 + 7;
    
    const waysToMakeSum: number[] = Array(n + 1).fill(0);
    waysToMakeSum[0] = 1;
    
    for (let baseNumber = 1; baseNumber <= n; baseNumber++) {
        const powerValue = Math.pow(baseNumber, x);
        
        if (powerValue > n) {
            break;
        }
        
        for (let targetSum = n; targetSum >= powerValue; targetSum--) {
            waysToMakeSum[targetSum] = (waysToMakeSum[targetSum] + waysToMakeSum[targetSum - powerValue]) % MODULO;
        }
    }
    
    return waysToMakeSum[n];
};