function minOperations(nums: number[], k: number): number {
    let sum = 0;
    for (const x of nums) sum += x;
    return sum % k;
}