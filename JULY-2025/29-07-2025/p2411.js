var smallestSubarrays = function(nums) {
    let n = nums.length;
    let result = Array(n).fill(1);
    let lastSeen = Array(32).fill(-1);

    for (let i = n - 1; i >= 0; i--) {
        for (let b = 0; b < 32; b++) {
            if ((nums[i] >> b) & 1) {
                lastSeen[b] = i;
            }
        }

        let farthest = i;
        for (let b = 0; b < 32; b++) {
            if (lastSeen[b] !== -1) {
                farthest = Math.max(farthest, lastSeen[b]);
            }
        }

        result[i] = farthest - i + 1;
    }

    return result;
};