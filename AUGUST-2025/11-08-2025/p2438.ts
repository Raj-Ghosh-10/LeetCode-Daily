function productQueries(n: number, queries: number[][]): number[] {
    const MOD = 1000000007;
    
    const powers: number[] = [];
    let temp = n;
    let power = 1;
    
    while (temp > 0) {
        if (temp & 1) { 
            powers.push(power);
        }
        power *= 2;
        temp >>>= 1;
    }
    
    const results: number[] = [];
    
    for (const [left, right] of queries) {
        let product = 1;
        
        for (let i = left; i <= right; i++) {
            product = (product * powers[i]) % MOD;
        }
        
        results.push(product);
    }
    
    return results;
}

function showPowers(n: number): void {
    const powers: number[] = [];
    let temp = n;
    let power = 1;
    
    while (temp > 0) {
        if (temp & 1) {
            powers.push(power);
        }
        power *= 2;
        temp >>>= 1;
    }
    
    console.log(`\nFor n = ${n}, powers = [${powers.join(',')}]`);
}

showPowers(15);
showPowers(2);