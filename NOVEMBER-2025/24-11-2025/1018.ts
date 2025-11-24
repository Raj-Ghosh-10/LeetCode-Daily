function prefixesDivBy5(nums: number[]): boolean[] {
    const ans: boolean[] = [];
    let mod = 0;

    for (const bit of nums) {
        mod = (mod * 2 + bit) % 5;
        ans.push(mod === 0);
    }

    return ans;
}