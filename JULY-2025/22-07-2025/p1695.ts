function maximumUniqueSubarray(nums: number[]): number {
    let seen = new Set<number>();
    let cs = 0, maxSum = 0, start = 0;
    // cs means current sum

    for (let i = 0; i < nums.length; i++) {
        // while loop run till the repeating element get delted
        while (seen.has(nums[i])) {
            seen.delete(nums[start]); // deleting nums[start] not nums[i]
            cs = cs - nums[start];
            start++;
        }

        seen.add(nums[i]);
        cs = cs+ nums[i];
        maxSum = Math.max(maxSum, cs);
    }

    return maxSum;
}

//TC:SC: O(N)