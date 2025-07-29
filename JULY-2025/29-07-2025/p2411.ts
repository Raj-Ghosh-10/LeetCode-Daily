function smallestSubarrays(nums: number[]): number[] {
    const n = nums.length;
    const res : number[] = new Array(n).fill(1);
    for (let i = 0 ; i < n; i++){
        for (let j = i - 1; j >= 0 && (nums[j] !== (nums[i] | nums[j])); j--){
            nums[j] = nums[i] | nums[j];
            res[j] = i - j + 1;
        }
    }
    return res;
};