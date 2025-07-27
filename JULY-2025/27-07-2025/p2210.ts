function countHillValley(nums: number[]): number {
    // Step 1: Remove consecutive duplicates
    const compressed: number[] = [nums[0]];
    for (let i = 1; i < nums.length; i++) {
        if (nums[i] !== nums[i - 1]) {
            compressed.push(nums[i]);
        }
    }

    // Step 2: Count hills and valleys
    let count = 0;
    for (let i = 1; i < compressed.length - 1; i++) {
        if (
            (compressed[i] > compressed[i - 1] && compressed[i] > compressed[i + 1]) ||
            (compressed[i] < compressed[i - 1] && compressed[i] < compressed[i + 1])
        ) {
            count++;
        }
    }

    return count;
}